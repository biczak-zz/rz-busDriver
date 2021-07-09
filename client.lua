local jobId = 0 -- This determines which route the player chose
local jobVehicle = nil -- Handles the vehicle associated with each route
local stopNumber = nil -- Which stop in the route the player is on
local jobBlip = nil -- The blip for the minimap
local routeComplete = false -- True when all stops in a route have been hit, otherwise false
local onActiveRoute = false -- True when the player has accepted a shift, false when route is canceled or completed

function createJobLocationBlip() -- Shows the location of the job
  local blip = AddBlipForCoord(Config.jobLocation.x, Config.jobLocation.y, Config.jobLocation.z)
  
  SetBlipSprite(blip, 513) -- Sets the Blip to look like a Bus
  SetBlipDisplay(blip, 2) -- Blip shows on both the main map and minimap
  -- SetBlipScale(blip, 1.0)
  SetBlipColour(blip, 27) -- Sets the color to Bright Purple (Because Raze)
  SetBlipAsShortRange(blip, true) -- Displays the Blip only when the map is nearby
  
  -- Sets the Blip's Text
  BeginTextCommandSetBlipName('STRING')
  AddTextComponentString('Dashound Bus Center')
  EndTextCommandSetBlipName(blip)
end

function showNotification(msg) -- Shows notifications with job-related text
  SetNotificationTextEntry('STRING')
  AddTextComponentString(msg)
  DrawNotification(false, false)
end

function Draw3DText(x, y, z, text) -- Used to show instructional text at job location
    -- Check if coords are visible and get 2D screen coords
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then
      -- Calculate text scale to use
      local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
      local scale = 1.8*(1/dist)*(1/GetGameplayCamFov())*100
      
      -- Draw text on screen
      SetTextScale(scale, scale)
      SetTextFont(4)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 255)
      SetTextDropShadow(0, 0, 0, 0,255)
      SetTextDropShadow()
      SetTextEdge(4, 0, 0, 0, 255)
      SetTextOutline()
      BeginTextCommandDisplayText("STRING")
      SetTextCentre(1)
      AddTextComponentSubstringKeyboardDisplay(text)
      EndTextCommandDisplayText(_x, _y)
  end
end

function showMarker()
  local marker = Config.locationMarker
  local markerCoords = Config.jobLocation

  DrawMarker(marker.id, markerCoords.x, markerCoords.y, markerCoords.z-0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, marker.radius*2, marker.radius*2, marker.radius, marker.color.red, marker.color.green, marker.color.blue, marker.color.alpha, false, false, 2, marker.isRotating, false, false, false)

  if routeComplete == true then -- If a route is complete, display a marker the player can access while in the vehicle
    local busMarker = Config.vehicleSpawnMarker
    local busMarkerCoords = Config.vehicleSpawnLocation

    DrawMarker(busMarker.id, busMarkerCoords.x, busMarkerCoords.y, busMarkerCoords.z-0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, busMarker.radius*2, busMarker.radius*2, busMarker.radius, busMarker.color.red, busMarker.color.green, busMarker.color.blue, busMarker.color.alpha, false, false, 2, busMarker.isRotating, false, false, false)
  end
end

function showMarkerText() -- Displays instructional text above the markers
  local markerCoords = Config.jobLocation -- Where the marker spawns
  local markerText = Config.messages['menu_open']

  if onActiveRoute == true then -- Displays different text depending on whether or not the player is actively on a shift
    markerText = Config.messages['menu_alternate']
  end
  
  Draw3DText(markerCoords.x, markerCoords.y, markerCoords.z+0.80, markerText)
end

function startMainThread()
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(250)
      if DoesBlipExist(jobBlip) then
        RemoveBlip(jobBlip)
      end
      
      stopNumber = 1

      jobBlip = AddBlipForCoord(Config.routes[jobId][stopNumber].x , Config.routes[jobId][stopNumber].y, Config.routes[jobId][stopNumber].z)        

      SetBlipAsFriendly(jobBlip, 1)
      SetBlipColour(jobBlip, 27)
      SetBlipCategory(jobBlip, 3)
      SetBlipRoute(jobBlip,  true)
        
      showNotification(Config.messages['route_start'])

        while onActiveRoute == true do
          Citizen.Wait(0)
          local playerPed = GetPlayerPed(-1)
          local playerLocation = GetEntityCoords(playerPed)
          local playerVehicle = GetVehiclePedIsIn(playerPed, true)
          local vehicleSpeed = GetEntitySpeed(playerVehicle)
          local route = Config.routes[jobId]

          if onActiveRoute == true then
            if (GetDistanceBetweenCoords(playerLocation, route[stopNumber].x, route[stopNumber].y, route[stopNumber].z, true) < 10) and vehicleSpeed <= 0.05 then
              if playerVehicle == jobVehicle then

								if jobId ~= 3 then -- The tour bus doesn't have multiple doors or passengers getting on/off
									SetVehicleDoorOpen(playerVehicle, 0, false, false)
									SetVehicleDoorOpen(playerVehicle, 1, false, false)
									SetVehicleDoorOpen(playerVehicle, 2, false, false)
									SetVehicleDoorOpen(playerVehicle, 3, false, false)
								end

								Wait(500)
								
								if jobId == 3 then
									showNotification(Config.messages['next_stop'])
                elseif stopNumber > 2 then
                  showNotification(Config.messages['passengers_exit']) -- Passengers are not getting off before they get on
								end

                for i=0, 150, 1 do
									SetVehicleCheatPowerIncrease(jobVehicle, 1) -- Prevents the Bus from moving while the doors are open
									Wait(1)		
								end

								if jobId == 3 then
									showNotification(Config.routes[jobId].name)
                elseif stopNumber > 1 and stopNumber < #Config.routes[jobId] then
									showNotification(Config.messages['passengers_enter']) -- Passengers won't get on at the last stop or the depot
								end

								Wait(500)

								if jobId ~= 3 then -- Tour bus doesn't have these doors
									SetVehicleDoorShut(playerVehicle, 0, false)
									SetVehicleDoorShut(playerVehicle, 1, false)
									SetVehicleDoorShut(playerVehicle, 2, false)
									SetVehicleDoorShut(playerVehicle, 3, false)
								end

								if stopNumber == Config.shifts[jobId + 1].stops then -- If all stops have been hit
                  local turnInLocation = Config.vehicleSpawnLocation

                  routeComplete = true
									showNotification(Config.messages['route_complete'])
                  SetBlipCoords(jobBlip, turnInLocation.x, turnInLocation.y, turnInLocation.z) -- Set the blip back to the bus depot
								else
									stopNumber = stopNumber + 1

                  SetBlipCoords(jobBlip, route[stopNumber].x , route[stopNumber].y, route[stopNumber].z) -- Set the blip to the next stop
								end

								SetBlipRoute(jobBlip,  true) -- Set the GPS route to the next blip

								if jobId ~= 3 then -- jobId 3 uses a different message
									showNotification(Config.messages['next_stop'])
								end

							else
                if playerVehicle ~= 0 then
								  showNotification(Config.messages['wrong_vehicle'])
                end
              end
            end
          end
        end

        if onActiveRoute == false then
          break
        end

      end
  end)
end

RegisterNetEvent('rz-busDriver:jobIdChanged')
AddEventHandler('rz-busDriver:jobIdChanged', function(data)
  
  if DoesEntityExist(jobVehicle) then
    TriggerEvent('rz-busDriver:deleteVehicle') -- If there is a pre-existing job vehicle, delete it
  end
  
  jobId = data.id

  if jobId > 0 then -- If the player accepted a shift
    startMainThread()
    TriggerEvent('rz-busDriver:spawnVehicle')
    onActiveRoute = true
  end
  
  if jobId == 0 then
    routeComplete = false
  onActiveRoute = false
    TriggerEvent('rz-busDriver:endRoute') -- If they canceled their shift
  end
end)

RegisterNetEvent('rz-busDriver:deleteVehicle')
AddEventHandler('rz-busDriver:deleteVehicle', function()
  DeleteEntity(jobVehicle)
  jobVehicle = 0
end)

RegisterNetEvent('rz-busDriver:endRoute') -- Handles both cancelling and completing routes
AddEventHandler('rz-busDriver:endRoute', function(data)
  routeComplete = false
  onActiveRoute = false

  RemoveBlip(jobBlip)

  TriggerEvent('rz-busDriver:deleteVehicle')

  if data.status == 'complete' then
    TriggerEvent('rz-busDriver:payment') -- Payment trigger for completing the route
    showNotification(Config.messages['payment_sent'])
  else
    showNotification(Config.messages['route_canceled'])
  end
end)

RegisterNetEvent('rz-busDriver:spawnVehicle')
AddEventHandler('rz-busDriver:spawnVehicle', function()
  local vehicleModel = GetHashKey(Config.shifts[jobId + 1].vehicleModel)
  local spawnLocation = Config.vehicleSpawnLocation -- Where to spawn the vehicle

  RequestModel(vehicleModel)
    
  while not HasModelLoaded(vehicleModel) do
    Citizen.Wait(100)
  end
    
  jobVehicle = CreateVehicle(vehicleModel, spawnLocation.x, spawnLocation.y, spawnLocation.z, spawnLocation.heading, true, false)
    
  SetVehicleOnGroundProperly(jobVehicle) -- Place the bus down, gently
  SetModelAsNoLongerNeeded(vehicleModel) -- Unload the bus model from memory
  SetVehicleDirtLevel(jobVehicle, 0.0) -- Make the bus nice and pretty
end)

RegisterNetEvent('rz-busDriver:jobMenu')
AddEventHandler('rz-busDriver:jobMenu', function()
  if onActiveRoute == false then
    TriggerEvent('nh-context:sendMenu', {
      {
          id = 1,
          header = "Available Shifts",
          txt = ""
      },
      {
          id = 2,
          header = "Los Santos Transit",
          txt = "Drive a City Bus around Los Santos",
          params = {
              event = "rz-busDriver:jobIdChanged",
              args = {
                  id = 1
              }
          }
      },
      {
          id = 3,
          header = "Dashound",
          txt = "Drive a Dashound Coach Bus",
          params = {
              event = "rz-busDriver:jobIdChanged",
              args = {
                  id = 2
              }
          }
      },
      {
          id = 4,
          header = "Vinewood Tours",
          txt = "Drive a Tour Bus around Vinewood",
          params = {
              event = "rz-busDriver:jobIdChanged",
              args = {
                  id = 3
              }
          }
      },
    })
  elseif routeComplete == true then
    TriggerEvent('nh-context:sendMenu', {
      {
          id = 1,
          header = "Shift Options",
          txt = ""
      },
      {
          id = 0,
          header = "Complete Shift",
          txt = "Complete your shift and receive payment",
          params = {
              event = "rz-busDriver:endRoute",
              args = {
                  status = "complete"
              }
          }
      }
    })
  else
    TriggerEvent('nh-context:sendMenu', {
      {
          id = 1,
          header = "Shift Options",
          txt = ""
      },
      {
          id = 0,
          header = "Cancel Shift",
          txt = "Ends your shift and returns your vehicle",
          params = {
              event = "rz-busDriver:endRoute",
              args = {
                  status = "cancel"
              }
          }
      }
    })
  end
end)


RegisterNetEvent('onResourceStart')
AddEventHandler('onResourceStart', function(resource)
  if GetCurrentResourceName() == resource then
    createJobLocationBlip()
  end
end)

Citizen.CreateThread(function()
  local playerPed = GetPlayerPed(-1)
  
  while true do
  local playerLocation = GetEntityCoords(playerPed)
  local distanceToJob = GetDistanceBetweenCoords(playerLocation, Config.jobLocation.x, Config.jobLocation.y, Config.jobLocation.z, true)

    if distanceToJob < 100.0 then
      showMarker()
      if distanceToJob < Config.locationMarker.radius then
        showMarkerText()

        if IsControlJustPressed(1, 51) then
          TriggerEvent('rz-busDriver:jobMenu')
        end
      end
    end
    Citizen.Wait(0)
  end
end)
