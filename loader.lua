local function loadModules(path)
    local searchPath = path == "" and "*" or path .. "/*"
    local files, folders = file.Find(searchPath, "LUA")
    
    for _, filename in ipairs(files) do
        if string.EndsWith(filename, ".lua") then
            local filePath = path == "" and filename or path .. "/" .. filename
            
            local function safeLoad()
                local pref = string.StartWith(filename, "cl_")
                
                if pref == "cl_" then
                    if SERVER then 
                        AddCSLuaFile(filePath)
                    elseif CLIENT then 
                        include(filePath) 
                    end
                    
                elseif pref == "sv_" then
                    if SERVER then 
                        include(filePath) 
                    end
                    
                elseif pref == "sh_" then
                    if SERVER then
                        include(filePath)
                        AddCSLuaFile(filePath)
                    elseif CLIENT then
                        include(filePath)
                    end
                    
                else
                    if SERVER then
                        include(filePath)
                        AddCSLuaFile(filePath)
                    elseif CLIENT then
                        include(filePath)
                    end
                end
            end
            
            local ok, err = pcall(safeLoad)
            
            if !ok then
                MsgC(Color(255, 50, 50), "[ETN LIB | MODULE ERROR] Ошибка в: " .. filePath .. "\n")
                MsgC(Color(255, 100, 100), err .. "\n\n")
            end
        end
    end
    
    for _, folder in ipairs(folders) do
        local nextPath = path == "" and folder or path .. "/" .. folder
        local ok, err = pcall(loadModules, nextPath)
        
        if !ok then
            MsgC(Color(255, 50, 50), "[ETN LIB | MODULE ERROR] Ошибка чтения: " .. nextPath .. "\n" .. err .. "\n")
        end
    end
end

loadModules("main")