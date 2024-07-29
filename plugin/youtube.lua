-- دالة لطباعة الجداول
local function print_table(t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            print(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        print(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        print(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    elseif (type(val) == "string") then
                        print(indent .. "[" .. pos .. '] => "' .. val .. '"')
                    else
                        print(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                print(indent .. tostring(t))
            end
        end
    end
    if (type(t) == "table") then
        print(tostring(t) .. " {")
        sub_print_r(t, "  ")
        print("}")
    else
        sub_print_r(t, "  ")
    end
    print()
end

function youtube(msg)
    local text = nil
    if msg and msg.content and msg.content.text then
        text = msg.content.text.text
    end
    local msg_chat_id = msg.chat_id
    local msg_id = msg.id
    if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
        return false
    end
    if text then
        local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
        if neww then
            text = neww or text
        end
    end
    
    local function time_to_sec(time)
        local sec = 0
        local time_table = {}
        for i in string.gmatch(time, "%d+") do
            table.insert(time_table, i)
        end
        local hour = tonumber(time_table[1]) or 0
        local min = tonumber(time_table[2]) or 0
        local sec = tonumber(time_table[3]) or 0
        return hour * 3600 + min * 60 + sec
    end
    
    if text == "تعطيل اليوتيوب" or text == "تعطيل يوتيوب" then
        if not msg.Manger then
            send(msg.chat_id, msg.id, '\n*• هذا الامر يخص '..Controller_Num(6)..' * ', "md", true)
            return false
        end
        Redis:set(Fast.."yt:lock"..msg.chat_id, true)
        send(msg.chat_id, msg.id, '\n• تم تعطيل اليوتيوب ', "md", true)
    end
    
    if text == "تفعيل اليوتيوب" or text == "تفعيل يوتيوب" then
        if not msg.Manger then
            send(msg.chat_id, msg.id, '\n*• هذا الامر يخص '..Controller_Num(6)..' * ', "md", true)
            return false
        end
        Redis:del(Fast.."yt:lock"..msg.chat_id)
        send(msg.chat_id, msg.id, '\n• تم تفعيل اليوتيوب ', "md", true)
    end
    
    if text then
        if text:match("^بحث (.*)$") then
            if Redis:get(Fast.."yt:lock"..msg.chat_id) then
                send(msg.chat_id, msg.id, '*• اليوتيوب معطل*', "md", true)
                return false
            end
            local search = text:match("^بحث (.*)$")
            local command = "yt-dlp -j 'ytsearch:" .. search .. "'"
            local handle = io.popen(command)
            local result = handle:read("*a")
            handle:close()
            
            print("YT-DLP Result: ", result) -- طباعة النتيجة للتصحيح
            
            local videos = json:decode(result)
            if not videos then
                print("Error decoding JSON: ", result)
                send(msg.chat_id, msg.id, '*• لم يتم العثور على نتائج*', "md", true)
                return false
            end
        
            local datar = {data = {{text = "قناة البوت", url = 'http://t.me/'..chsource..''}}}
            for i = 1, math.min(6, #videos) do
                local video = videos[i]
                local link = video.url
                local title = video.title
                title = title:gsub("/", "-"):gsub("\n", "-"):gsub("|", "-"):gsub("'", "-"):gsub('"', "-")
                datar[i] = {{text = title, data = msg.sender_id.user_id.."dl/"..link}}
            end
            
            print("Datar: ", print_table(datar)) -- طباعة البيانات للتصحيح باستخدام الدالة الجديدة
            
            local reply_markup = bot.replyMarkup{
                type = 'inline',
                data = datar
            }
            send(msg.chat_id, msg.id, '• نتائج بحثك ل *'..search..'*', "md", false, false, false, false, reply_markup)
        end        
    end
    
    if Redis:get(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id) == "mp3" then
        Redis:del(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id)
        local rep = msg.id / 2097152 / 0.5
        local m = json:decode(https.request("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/youtube7odabot/7951&reply_to_message_id="..rep)).result.message_id
        local command = "yt-dlp -x --audio-format mp3 --output '%(title)s.%(ext)s' " .. link
        os.execute(command)
        bot.sendAudio(msg_chat_id, msg_id, './'..title..'.mp3', "["..title.."]("..link..")", "md", tostring(dur), title, p, "./"..rand..".png")
        https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
        Redis:del(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id)
        sleep(2)
        os.remove(title..".mp3")
        os.remove(rand..".png")
    end
    
    if Redis:get(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id) == "mp4" then
        local rep = msg.id / 2097152 / 0.5
        local m = json:decode(https.request("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/youtube7odabot/7951&reply_to_message_id="..rep)).result.message_id
        local command = "yt-dlp -f bestvideo+bestaudio --output '%(title)s.%(ext)s' " .. link
        os.execute(command)
        bot.sendVideo(msg_chat_id, msg_id, './'..title..'.mp4', "["..title.."]("..link..")", "md")
        https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
        Redis:del(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id)
        sleep(2)
        os.remove(title..".mp4")
    end
    
    if text == "يوتيوب" then
        if Redis:get(Fast.."yt:lock"..msg.chat_id) then
            send(msg.chat_id, msg.id, '*• اليوتيوب معطل*', "md", true)
            return false
        end
        local reply_markup = bot.replyMarkup{
            type = 'inline',
            data = {
                {
                    {text = 'تحميل صوت', data = senderr..'/mp3'..msg_id},
                    {text = 'تحميل فيديو', data = senderr..'/mp4'..msg_id},
                },
            }
        }
        return send(msg_chat_id, msg_id, [[*
        • اختر كيف تريد التحميل
        *]], "md", false, false, false, false, reply_markup)
    end
end

return {Fast = youtube}
