URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
Fx = require './libs/td'
local Fasttt =  require('tdlua') 
local client = Fasttt()
local tdf = Fx.xnxx()
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local Fast = io.open("Fast", 'w')
Fast:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 Fast.lua
done
]])
Fast:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('rm -rf bot.zip ;chmod +x *;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
bot = Fx.Fastbots.set_config{api_id=21043034,api_hash='ec282b2785006ee370d8d3b15c5ff1f3',session_name=Fast,token=Token}
chsource = Redis:get(Fast..'chsource') or "@F_T_Y"
devsource = Redis:get(Fast..'devsource') or "F_T_Y"
devsource2 = Redis:get(Fast..'devsource') or "F_T_Y"
function var(value)  
print(serpent.block(value, {comment=false}))   
end 

clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function convert_time(hours)
  local second = 0
  if hours ~= nil then
      second = hours * 3600
  end
  return second
end
function ctime(seconds)
local seconds = tonumber(seconds)
if seconds <= 0 then
return "00:00"
else
hours = string.format("%02.f", math.floor(seconds/3600));
mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
return mins..":"..secs
end
end
function plugins(msg)
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") and not Redis:sismember(Fast..'files',v) then
plugin = dofile("plugin/"..v)
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end
end
end
function RunCallBack(msg)
plugin = dofile("src/Callback.lua")
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end
function coin(coin)
local Coins = tostring(coin)
local Coins = Coins:gsub('٠','0')
local Coins = Coins:gsub('١','1')
local Coins = Coins:gsub('٢','2')
local Coins = Coins:gsub('٣','3')
local Coins = Coins:gsub('٤','4')
local Coins = Coins:gsub('٥','5')
local Coins = Coins:gsub('٦','6')
local Coins = Coins:gsub('٧','7')
local Coins = Coins:gsub('٨','8')
local Coins = Coins:gsub('٩','9')
local Coins = Coins:gsub('-','')
local conis = tonumber(Coins)
return conis
end
function src(msg)
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
src_files = dofile("src/"..v)
if src_files and src_files.Fast and msg then
results = src_files.Fast(msg)
end
end
end
end
function start_src()
i = 0
t = "source files \n"
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_src()
function start_plugin()
i = 0
t = "plugins \n"
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_plugin()
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..Token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit(chat,rep,text,parse, dis, disn, reply_markup)
shh = tostring(text)
if Redis:get(Fast..'rmzsource') then
shh = shh:gsub("• ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(shh, v)
if j and i then
local x = string.sub(shh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
shh = shh:gsub(x,neww)
else
shh = shh
end
end
return bot.editMessageText(chat,rep,shh, parse, dis, disn, reply_markup)
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
sh = tostring(text)
if Redis:get(Fast..'rmzsource') then
sh = sh:gsub("• ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(sh, v)
if j and i then
local x = string.sub(sh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
sh = sh:gsub(x,neww)
else
sh = sh
end
end
return bot.sendText(chat,rep,sh,parse,dis, clear, disn, back, markup)
end
function ss(msg,text) 
return send(msg.chat_id,msg.id,text)
end
function calc(math) 
math = math:gsub(" ","")
if math:match("%d+") then
local res = io.popen("echo 'scale=1; "..math.."' | bc"):read('*a')
return res
else
return "• لم استطيع اجراء العمليه الحسابيه"
end
end
function getbio(User)
kk = "لا يوجد"
local url = https.request("https://api.telegram.org/bot"..Token.."/getchat?chat_id="..User);
data = json:decode(url)
if data.result then
if data.result.bio then
kk = data.result.bio
end
end
return kk
end
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos = {Sudo_Id,5413631898,5413631898,5413631898}
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) or Redis:sismember("dev:all:source",UserId) then
ControllerAll = true
end
end
return ControllerAll
end
function mderall(msg)
mderall = false
local statuse = Redis:sismember(Fast.."Specialall:Group",senderr)
if statuse then
mderall = true
end
return mderall
end
function Controllerbanall(ChatId,UserId)
Status = 0
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId)
dev_source = Redis:sismember("dev:all:source",UserId)
if UserId == 5413631898 then
Status = true
elseif UserId == 5413631898 then
Status = true
elseif UserId == 5413631898 then  
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == Fast then
Status = true
elseif Controll2 then
Status = true
elseif Devss then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Devss = Redis:sismember(Fast.."Devss:Groups",UserId)
dev_source = Redis:sismember("dev:all:source",UserId)
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 5413631898 then
Status = 'مطـور السـورس '
elseif UserId == 5413631898 then
Status = 'مطـور السـورس '
elseif UserId == 5413631898 then  
Status = 'مطـور السـورس'
elseif UserId == Sudo_Id then  
Status = 'مـالك الـبوت'
elseif dev_source then  
Status = 'مطـور السـورس'
elseif Controll2 then
Status = 'المطـور الاساسي '
elseif UserId == Fast then
Status = 'البوت'
elseif Devss then
Status = 'المطـور الثانوي '
elseif Dev then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Developer:Bot:Reply"..ChatId) or 'المطـــور '
elseif Ownerss then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."PresidentQ:Group:Reply"..ChatId) or  'المــــــالك 🌟'
elseif SuperCreator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."President:Group:Reply"..ChatId) or 'المنشئ الاساسي 🌟'
elseif Creator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Constructor:Group:Reply"..ChatId) or 'المنشــىء 🌟'
elseif Manger then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Manager:Group:Reply"..ChatId) or 'المـــــدير 🌟'
elseif Admin then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Admin:Group:Reply"..ChatId) or 'الادمـــــن 🌟'
elseif StatusMember == "chatMemberStatusCreator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مالك الجروب'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مشرف الجروب'
elseif Special then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Vip:Group:Reply"..ChatId) or 'المميــز ⭐️'
else
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Mempar:Group:Reply"..ChatId) or 'العضـو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
elseif tonumber(Num) == 8 then  
Status = 'المالك'
else
Status = 'المميز'
end  
return Status
end

function Tag(UserId)
local UserInfo = bot.getUser(UserId)
local Name_User = FlterBio(UserInfo.first_name)
local UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
return UserInfousername
-- BY ANUBIS --
end

function Logger(MSG, from_id, user_id, state, role, lock)
-- BY ANUBIS --
local chat_id = MSG.chat_id
local msg_id = MSG.id
if Redis:get(Fast..":logger:chat_id:"..chat_id..":") then
local logger_chat = Redis:get(Fast..":logger:chat_id:"..chat_id..":")
-- from_id
if from_id then
from_tag_logger = Tag(from_id)
end
-- from_id
-- user_id
if user_id then 
user_tag_logger = Tag(user_id)
end
-- user_id

if state and role then -- state and role
msg_text_logger = "بواسطه : ( "..from_tag_logger.." )\nتم "..(state or nil).." : ( "..user_tag_logger.." ) "
if role then
msg_text_logger = msg_text_logger.."-> "..(role or "000000")
end
elseif lock then -- lock
msg_text_logger = "بواسطه : ( "..from_tag_logger.." )\nتم "..lock
end -- end state and lock

local date = "\nالوقت : "..os.date("%I:%M%p").."\nالتاريخ : "..os.date("%Y/%m/%d")
send(logger_chat,0,msg_text_logger..date,"md",true)
end
-- BY ANUBIS --
end

function FlterBio(Bio)
local Bio = tostring(Bio)
Bio = Bio:gsub("https://[%a%d_]+",'') 
Bio = Bio:gsub("http://[%a%d_]+",'') 
Bio = Bio:gsub("telegram.dog/[%a%d_]+",'') 
Bio = Bio:gsub("telegram.me/[%a%d_]+",'') 
Bio = Bio:gsub("t.me/[%a%d_]+",'') 
Bio = Bio:gsub("[%a%d_]+.pe[%a%d_]+",'') 
Bio = Bio:gsub("@[%a%d_]+",'')
Bio = Bio:gsub("]","")
Bio = Bio:gsub("[[]","")
return Bio
end
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = bot.getChatMember(ChatId,user2).status 
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير معلومات الجروب : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '- تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '- حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '- دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '- مسح الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '- اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"• صلاحيات الادمن - ", 'md', false, false, reply_markupp)
end
function editrtp(chat,user,msgid,useri)
if Redis:sismember(Fast.."BanGroup:Group"..chat,useri) then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if Redis:sismember(Fast.."SilentGroup:Group"..chat,useri) then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if Redis:sismember(Fast.."SuperCreator:Group"..chat,useri)  then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Redis:sismember(Fast.."Creator:Group"..chat,useri) then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Redis:sismember(Fast.."Manger:Group"..chat,useri) then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Redis:sismember(Fast.."Admin:Group"..chat,useri) then
Adminz = "✔"
else
Adminz = "❌"
end
if Redis:sismember(Fast.."Special:Group"..chat,useri) then
Specialz = "✔"
else
Specialz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =user..'/statusSuperCreatorz/'..useri},{text = '- منشئ : '..Creatorz, data =user..'/statusCreatorz/'..useri},
},
{
{text = '- مدير : '..Mangerz, data =user..'/statusMangerz/'..useri},{text = '- ادمن : '..Adminz, data =user..'/statusAdminz/'..useri},
},
{
{text = '- مميز : '..Specialz, data =user..'/statusSpecialz/'..useri},
},
{
{text = '- الحظر : '..BanGroupz, data =user..'/statusban/'..useri},{text = '- الكتم : '..SilentGroupz, data =user..'/statusktm/'..useri},
},
{
{text = '- عضو  ', data =user..'/statusmem/'..useri},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return edit(chat,msgid,'*\n• تحكم برتب الشخص .*', 'md', true, false, reply_markup)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = bot.getChatMember(ChatId,UserId).status 
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(Fast.."Lock:phshar"..ChatId) then    
alphsar = "✔️"
else 
alphsar = "❌"    
end
if Redis:get(Fast.."Lock:alkfr"..ChatId) then    
alkfr = "✔️"
else 
alkfr = "❌"    
end
if Redis:get(Fast.."Lock:tphlesh"..ChatId) then    
tphlesh = "✔️"
else 
tphlesh = "❌"    
end
if Redis:get(Fast.."Lock:farsia"..ChatId) then    
farsia = "✔️"
else 
farsia = "❌"    
end

if Redis:get(Fast.."lockpin"..ChatId) then    
lock_pin = "✔️"
else 
lock_pin = "❌"    
end
if Redis:get(Fast.."Lock:tagservr"..ChatId) then    
lock_tagservr = "✔️"
else 
lock_tagservr = "❌"
end
if Redis:get(Fast.."Lock:text"..ChatId) then    
lock_text = "✔️"
else 
lock_text = "❌ "    
end
if Redis:get(Fast.."Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✔️"
else 
lock_add = "❌ "    
end    
if Redis:get(Fast.."Lock:Join"..ChatId) == "kick" then
lock_join = "✔️"
else 
lock_join = "❌ "    
end    
if Redis:get(Fast.."Lock:edit"..ChatId) then    
lock_edit = "✔️"
else 
lock_edit = "❌ "    
end
if Redis:get(Fast.."Chek:Welcome"..ChatId) then
welcome = "✔️"
else 
welcome = "❌ "    
end
if Redis:hget(Fast.."Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقييد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✔️"
else     
flood = "❌ "     
end
if Redis:get(Fast.."Lock:Photo"..ChatId) == "del" then
lock_photo = "✔️" 
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "❌ "   
end    
if Redis:get(Fast.."Lock:Contact"..ChatId) == "del" then
lock_phon = "✔️" 
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "❌ "    
end    
if Redis:get(Fast.."Lock:Link"..ChatId) == "del" then
lock_links = "✔️"
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "❌ "    
end
if Redis:get(Fast.."Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✔️"
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "❌ "    
end
if Redis:get(Fast.."Lock:User:Name"..ChatId) == "del" then
lock_user = "✔️"
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقييد "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "❌ "    
end
if Redis:get(Fast.."Lock:hashtak"..ChatId) == "del" then
lock_hash = "✔️"
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقييد "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "❌ "    
end
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_muse = "✔️"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "❌ "    
end 
if Redis:get(Fast.."Lock:Video"..ChatId) == "del" then
lock_ved = "✔️"
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "❌ "    
end
if Redis:get(Fast.."Lock:Animation"..ChatId) == "del" then
lock_gif = "✔️"
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "❌ "    
end
if Redis:get(Fast.."Lock:Sticker"..ChatId) == "del" then
lock_ste = "✔️"
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "❌ "    
end
if Redis:get(Fast.."Lock:geam"..ChatId) == "del" then
lock_geam = "✔️"
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "❌ "    
end    
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_vico = "✔️"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "❌ "    
end    
if Redis:get(Fast.."Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✔️"
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقييد "
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "❌ "
end
if Redis:get(Fast.."Lock:forward"..ChatId) == "del" then
lock_fwd = "✔️"
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقييد "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "❌ "    
end    
if Redis:get(Fast.."Lock:Document"..ChatId) == "del" then
lock_file = "✔️"
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "❌ "    
end    
if Redis:get(Fast.."Lock:Unsupported"..ChatId) == "del" then
lock_self = "✔️"
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "❌ "    
end
if Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✔️"
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "❌ "    
end
if Redis:get(Fast.."Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✔️"
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "❌ "    
end
if Redis:get(Fast.."Lock:Spam"..ChatId) == "del" then    
lock_spam = "✔️"
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "❌ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam,
farsia = farsia,
tphlesh = tphlesh,
alkfr = alkfr,
alphsar = alphsar
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'انت مش بتتفاعل لي '
elseif tonumber(Message) < 200 then 
MsgText = 'متشد شويه في التفاعل'
elseif tonumber(Message) < 400 then 
MsgText = 'انتي مكسوفه تتكلمي يبطه '
elseif tonumber(Message) < 700 then 
MsgText = 'في احسن من كدا هه'
elseif tonumber(Message) < 1200 then 
MsgText = 'انا عاوزك تولعها '
elseif tonumber(Message) < 2000 then 
MsgText = 'انت متفاعل يبن عمي'
elseif tonumber(Message) < 3500 then 
MsgText = 'بحبك اتفاعل كمان بقا '
elseif tonumber(Message) < 4000 then 
MsgText = 'استمر يبن عمي '
elseif tonumber(Message) < 4500 then 
MsgText = 'عاش كيك ليك'
elseif tonumber(Message) < 5500 then 
MsgText = 'انت مولعها وخاربها هنا '
elseif tonumber(Message) < 7000 then 
MsgText = 'تفاعل مفاعل نووي '
elseif tonumber(Message) < 9500 then 
MsgText = 'تفاعل ام عبير وهي بتكلم ام احمد عشان تجوز احمد لعبير'
elseif tonumber(Message) < 10000000000 then 
MsgText = 'كتفم التفاعل لاجلك '
end 
return MsgText 
end
function Total_groups(Message)  
local MsgText = ''  
if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'ملك التلكرام 💖'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات الجروب : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"• صلاحيات الجروب - ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
KtmAll = Redis:sismember(Fast.."KtmAll:Groups",UserId) ,
BanAll = Redis:sismember(Fast.."BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = bot.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
UserInfousername = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
UserInfousername = '['..UserInfo.first_name..'](tg://user?id='..UserId..')'
end
return {
Lock     = '\n⇜ من 「 '..UserInfousername..' 」\n'..TextMsg..'\n✧',
unLock   = '\n⇜ من 「 '..UserInfousername..' 」\n'..TextMsg..'\n✧',
lockKtm  = '\n⇜ من 「 '..UserInfousername..' 」\n'..TextMsg..'\n⇜ بالكتم ',
lockKid  = '\n⇜ من 「 '..UserInfousername..' 」\n'..TextMsg..'\n⇜ بالتقييد ',
lockKick = '\n⇜ من 「 '..UserInfousername..' 」\n'..TextMsg..'\n⇜ بالطرد ',
Reply    = '\n「 '..UserInfousername..' 」\n'..TextMsg..'\n'
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId)
dev_source = Redis:sismember("dev:all:source",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 5413631898 then
Status = true
elseif UserId == 5413631898 then
Status = true
elseif UserId == 5413631898 then  
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif Controll2 then
Status = true
elseif dev_source then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif Special then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId)
dev_source = Redis:sismember("dev:all:source",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 5413631898 then
Status = true
elseif UserId == 5413631898 then
Status = true
elseif UserId == 5413631898 then    
Status = true
elseif Controll2 then
Status = true
elseif dev_source then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = bot.getChatMember(msg.chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'w')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoinch(msg)
JoinChannel = true
local Channel = Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function ChannelJoin(msg)
JoinChannel = true
if not Redis:sismember(Fast.."BotFree:Group:",msg.chat_id) then
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
end
return JoinChannel
end

function File_Bot_Run(msg,data)  
--var(data)
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
senderr = msg.sender_id.user_id
local msg_id = msg.id
local text = nil
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
else
return false 
end
end
--[[
if msg.content.voice_note and Redis:get(Fast..msg_chat_id.."sound:cmd") then 
local mr = msg.content.voice_note.voice.remote.id
local url = http.request("http://159.223.13.231/oda/voiceRecognise?token="..Token.."&file_id="..mr)
local json = JSON.decode(url)
if json and json.msg then
text = json.msg
print(text)
end --]]
if data.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "تون") 
text = data.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end


if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end 
if text == 'كانسل' and tonumber(senderr) == tonumber(5413631898) then
Redis:del(Fast..msg.chat_id..'update:')
send(msg.chat_id,msg.id,"ضنن")
end
if Redis:get(Fast..msg.chat_id..'update:') then
local msgg_idd = tonumber(Redis:get(Fast..msg.chat_id..'update:'))
return https.request("http://api.telegram.org/bot"..Token.."/editmessagetext?chat_id="..msg_chat_id.."&message_id="..msgg_idd.."&text="..URL.escape(serpent.block(data, {comment=false})))
end
if text == 'ابديت' and tonumber(senderr) == tonumber(5413631898) then
local msg_idd = json:decode(https.request("http://api.telegram.org/bot"..Token.."/sendmessage?chat_id="..msg_chat_id.."&text="..URL.escape(serpent.block(data, {comment=false})))).result.message_id
Redis:set(Fast..msg.chat_id..'update:',tonumber(msg_idd))
end
if msg.sender_id.Fastbots == "messageSenderChat" then
senderr = msg.sender_id.chat_id
if msg.content.text then
text = msg.content.text.text
end
if Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,"xx"..tonumber(msg.sender_id.chat_id)) then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end 
if Redis:get(Fast.."Lock:SenderChat"..msg_chat_id) then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
return false 
end


if tonumber(senderr) == 5413631898 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == 5413631898 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == 5413631898 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif Redis:sismember("dev:all:source",senderr) then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == tonumber(Sudo_Id) then
msg.The_Controller = 1
msg.Name_Controller = 'مـالك الـبوت '
elseif Redis:sismember(Fast.."ControlAll:Groups",senderr) == true then
msg.The_Controller = 1
msg.Name_Controller = 'المطـور الاساسي'
elseif Redis:sismember(Fast.."Devss:Groups",senderr) == true then
msg.The_Controller = 2
msg.Name_Controller = 'المطـور الثانوي '
elseif Redis:sismember(Fast.."Dev:Groups",senderr) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Developer:Bot:Reply"..msg.chat_id) or 'المطـــور  '
elseif Redis:sismember(Fast.."Ownerss:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."PresidentQ:Group:Reply"..msg.chat_id) or 'المــــــالك 🌟 '
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي 🌟'
elseif Redis:sismember(Fast.."Creator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Constructor:Group:Reply"..msg.chat_id) or 'المنشــىء 🌟 '
elseif Redis:sismember(Fast.."Manger:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Manager:Group:Reply"..msg.chat_id) or 'المــــدير 🌟 '
elseif Redis:sismember(Fast.."Admin:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Admin:Group:Reply"..msg.chat_id) or 'الادمـــــن 🌟 '
elseif Redis:sismember(Fast.."Special:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Vip:Group:Reply"..msg.chat_id) or 'المميــز ⭐️ '
elseif tonumber(senderr) == tonumber(Fast) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Mempar:Group:Reply"..msg.chat_id) or 'العضـو '
end  
if msg.The_Controller == 1 then  
msg.Asasy = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.Devss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Dev = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.Ownerss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.SuperCreator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Creator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Manger = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Admin = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Special = true
end
list_A_files = {"Callback.lua","script.lua","pvbot.lua","rtba.lua"}
if text and text:match("^تعطيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تعطيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"• من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:sadd(Fast..'files',file)
return send(msg.chat_id,msg.id,"• تم تعطيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"• لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"• يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"• هذا الامر يخص المطور الاساسي")
end
end

if text and text:match("^تفعيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تفعيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"• من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:srem(Fast..'files',file)
return send(msg.chat_id,msg.id,"• تم تفعيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"• لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"• يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"• هذا الامر يخص المطور الاساسي")
end
end
if text == "الملفات" then
if msg.Asasy then
i = 0 
txx = "قائمه ملفاتك (*اضغط علي اسم ملف ليتم نسخه*)\n\n"
for v in io.popen('ls plugin'):lines() do
if Redis:sismember(Fast..'files',v) then
state = "{معطل}"
else 
state = "{مفعل}"
end
i = i +1
txx = txx..i..'- `'..v..'` '..state..'\n'
end
if i < 1 then
send(msg.chat_id,msg.id,"• لا توجد ملفات","md")
else
send(msg.chat_id,msg.id,txx.."\n\n *يمكنك تفعيل الملف عن طريق امر  (تفعيل ملف + اسم الملف)*","md")
end
else
send(msg.chat_id,msg.id,"• هذا الامر يخص المطور الاساسي")
end
end

plugins(msg)
src(msg)

if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end

if msg.sender_id.Fastbots ~= "messageSenderChat" then
if Statusrestricted(msg.chat_id,msg.sender_id.user_id).KtmAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).SilentGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilterq') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.Fastbots == "messagePhoto" then
Filters = 'الصورة'
Redis:srem(Fast.."All:List:Filter",'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.photo.sizes[1].photo.id)  
elseif msg.content.Fastbots == "messageAnimation" then
Filters = 'المتحركة'
Redis:srem(Fast.."All:List:Filter",'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.animation.animation.id)  
elseif msg.content.Fastbots == "messageSticker" then
Filters = 'الملصق'
Redis:srem(Fast.."All:List:Filter",'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.sticker.sticker.id)  
elseif text then
Redis:srem(Fast.."All:List:Filter",'text:'..text)  
Redis:del(Fast.."All:Filter:Group:"..text)  
Filters = 'النص'
end
Redis:del(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم الغاء منع عام ("..Filters..")","md",true)  
end
end

if Redis:get(Fast.."Lock:text"..msg_chat_id) and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.Fastbots == "messageChatJoinByLink" and not msg.Special then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) ~= tonumber(Fast) then
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeBot" then
if Lock_Bots == "del" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end
end

if msg.content.Fastbots == "messageChatAddMembers" then
Redis:incr(Fast.."Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
end


if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{الاسم}',(FlterBio(UserInfo.first_name) or '---')) 
Welcome = Welcome:gsub('{المعرف}',("@"..UserInfo.username or '---')) 
Welcome = Welcome:gsub('{الجروب}',(Get_Chat.title or '---')) 
Welcome = Welcome:gsub('{الاعضاء}',Info_Chats.member_count) 
Welcome = Welcome:gsub('{الادمنيه}',Info_Chats.administrator_count) 
Welcome = Welcome:gsub('{الوقت}',os.date("%H:%M:%S")) 
Welcome = Welcome:gsub('{التاريخ}',os.date("%Y/%m/%d")) 
return send(msg_chat_id,msg_id,Welcome,"md")  
else 
local GroupsWelcome = Redis:get(Fast.."Welcome:Groups")
if GroupsWelcome then
GroupsWelcome = GroupsWelcome:gsub('{الاسم}',(FlterBio(UserInfo.first_name) or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{المعرف}',("@"..UserInfo.username or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{الجروب}',(Get_Chat.title or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{الاعضاء}',Info_Chats.member_count) 
GroupsWelcome = GroupsWelcome:gsub('{الادمنيه}',Info_Chats.administrator_count) 
GroupsWelcome = GroupsWelcome:gsub('{الوقت}',os.date("%H:%M:%S")) 
GroupsWelcome = GroupsWelcome:gsub('{التاريخ}',os.date("%Y/%m/%d")) 
local TextWelcome = (GroupsWelcome or '*•نورت يقمر ♥♡\n ْ'..(FlterBio(UserInfo.first_name) or '---')..'\n ْ'..(Get_Chat.title or '---')..' \n• يجب احترام الادمنية\n• الالتزام بالقوانين في الوصف\n• الاعضاء '..Info_Chats.member_count..'~ الادمنيه '..Info_Chats.administrator_count..' \n• وقت الانضمام :('..os.date("%H:%M:%S")..')\n• تاريخ الانضمام :('..os.date("%Y/%m/%d")..')*\n')
send(msg_chat_id,msg_id,TextWelcome,"md")  
else
local TextWelcome = ('*•نورت يقمر♥♡\n ْ'..(FlterBio(UserInfo.first_name) or '---')..'\n ْ'..(Get_Chat.title or '---')..' \n• يجب احترام الادمنية\n• الالتزام بالقوانين في الوصف\n• الاعضاء '..Info_Chats.member_count..'~ الادمنيه '..Info_Chats.administrator_count..' \n• وقت الانضمام :('..os.date("%H:%M:%S")..')\n• تاريخ الانضمام :('..os.date("%Y/%m/%d")..')*\n')
send(msg_chat_id,msg_id,TextWelcome,"md")  
end
end
end
end 
if not msg.Special and msg.content.Fastbots ~= "messageChatAddMembers" and Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
local floods = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(Fast.."Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0), send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• قام بالتكرار في الجروب وتم طرده").Reply,"md",true)
end
if type == "del" then 
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if type == "keed" then
return bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• قام بالتكرار في الجروب وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id)) 
return send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"• قام بالتكرار في الجروب وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(Fast.."Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Special then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المنشورات \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المنشورات \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المنشورات \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id))
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المنشورات \n ✓',"md")
end
end
end
if msg.forward_info and not msg.Admin then -- التوجيه
local Fwd_Group = Redis:get(Fast.."Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tounmber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال التوجيه \n ✓',"md")
end
end

return false
end 
if msg.content.Fastbots == "messagePhoto" or msg.content.Fastbots == "messageAnimation" or msg.content.Fastbots == "messageSticker" or msg.content.Fastbots == "messageVoiceNote" or msg.content.Fastbots == "messageVideo" or msg.content.Fastbots == "messageAudio" or msg.content.Fastbots == "messageVideoNote" then
if not msg.Admin then
if Redis:get(Fast.."Lock:AlUasat"..msg_chat_id) then 
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
end

if msg.reply_markup and msg.reply_markup.Fastbots == "replyMarkupInlineKeyboard" then
if not msg.Special then  -- الكيبورد
local Keyboard_Group = Redis:get(Fast.."Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,toumber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الكيبورد \n ✓',"md")
end
end
end

end 

if msg.content.location and not msg.Special then  -- الموقع
if location then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المواقع \n ✓',"md")
end
end

end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.Fastbots == "textEntityTypeUrl" and not msg.Special then  -- الماركداون
local Markduan_Gtoup = Redis:get(Fast.."Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الماركداون \n ✓',"md")
end
end

end 

if msg.content.game and not msg.Special then  -- الالعاب
local Games_Group = Redis:get(Fast.."Lock:geam"..msg_chat_id)
if Games_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الالعاب \n ✓',"md")
end
end

end 
if msg.content.Fastbots == "messagePinMessage" then -- رسالة التثبيت
local Pin_Msg = Redis:get(Fast.."lockpin"..msg_chat_id)
if Pin_Msg and not msg.Manger then
if Pin_Msg:match("(%d+)") then 
local PinMsg = bot.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.Fastbots~= "ok" then
return send(msg_chat_id,msg_id,"\n• لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if UnPin.Fastbots ~= "ok" then
return send(msg_chat_id,msg_id,"\n• لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return send(msg_chat_id,msg_id,"\n• التثبيت معطل من قبل المدراء ","md",true)
end

end 

if msg.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end

if msg.content.Fastbots == "messageChatDeleteMember" and not Redis:get(Fast.."spammkick"..msg.chat_id) then 
if msg.sender_id.user_id ~= Fast then
Num_Msg_Max = 4
local UserInfo = bot.getUser(msg.sender_id.user_id)
local names = FlterBio(UserInfo.first_name)
local monsha = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if Redis:ttl(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) < 0 then
Redis:del(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id)
end
local ttsaa = (Redis:get(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id) or 0)
if tonumber(ttsaa) >= tonumber(3) then 
local type = Redis:hget(Fast.."Storm:Spam:Group:User"..msg.chat_id,"Spam:User") 
local removeMembars = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..msg.sender_id.user_id.."&can_change_info=false&can_manage_chat=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
local Json_Info = JSON.decode(removeMembars)
Redis:srem(Fast.."SuperCreator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Creator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Manger:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Admin:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Special:Group"..msg.chat_id,msg.sender_id.user_id)
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local v = monsha[1]
local tecxt = ListMembers.."\n• نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n• المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n• قام بالتكرار في ازاله الاعضاء \n• لا يمكنني تنزيله من المشرفين"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: can't remove chat owner" then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n• نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n• المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n• هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == true and Json_Info.result == true then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local v = monsha[1]
local tecxt = ListMembers.."\n• نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n• المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n• قام بتكرار طرد الاعضاء وطرد اكثر من 3 وتم تنزيله من المشرفين "
send(msg_chat_id,msg_id,tecxt,"md")
end
end
Redis:del(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id)
end
Redis:setex(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 3600, true) 
Redis:incrby(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id, 1)  
end
end 

if text and text:match('طرد @(.*)') or text and text:match('حظر @(.*)') or text and text:match('طرد (%d+)') or text and text:match('حظر (%d+)') then 
if not Redis:get(Fast.."spammkick"..msg.chat_id) then 
if msg.sender_id.user_id ~= Fast then
Num_Msg_Max = 4
local UserInfo = bot.getUser(msg.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if Redis:ttl(Fast.."qmkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) < 0 then
Redis:del(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id)
end
local ttsaa = (Redis:get(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id) or 0)
if tonumber(ttsaa) >= tonumber(5) then 
local removeMembars = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..msg.sender_id.user_id.."&can_change_info=false&can_manage_chat=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
local Json_Info = JSON.decode(removeMembars)
Redis:srem(Fast.."SuperCreator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Creator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Manger:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Admin:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Special:Group"..msg.chat_id,msg.sender_id.user_id)
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n• المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n• قام بالتكرار في ازاله الاعضاء \n• لا يمكنني تنزيله من المشرفين"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: can't remove chat owner" then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n• المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n• هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == true and Json_Info.result == true then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n• المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n• هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
Redis:del(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id)
end
Redis:setex(Fast.."qmkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 3600, true) 
Redis:incrby(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id, 1)  
end
end 
end

if msg.content.Fastbots == "messagePhoto" and Redis:get(Fast..'welcom_ph:witting'..msg.sender_id.user_id) then  -- الصور
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast..':WELCOME_BOT',idPhoto)
Redis:del(Fast..'welcom_ph:witting'..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, '• تم تغيير صـورهہ‏‏ آلترحيب للبوت\n✓')
end



if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص

Redis:incr(Fast.."Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
local AddMembrs = Redis:get(Fast.."Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) == tonumber(Fast) then
local idephoto = Redis:get(Fast..':WELCOME_BOT')
if idephoto then
local Bot_Name = (Redis:get(Fast.."Name:Bot") or "تون")
return bot.sendPhoto(msg.chat_id, msg.id, idephoto,
'\n*• اهلا انآ بوت اسمي '..Bot_Name..''..
'\n• آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت'..
'\n• مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...'..
'\n• مـعـرف الـمـطـور  : @'..UserSudo..
'*', "md")
end
end
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeRegular" then
Redis:incr(Fast.."Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) 
if AddMembrs == "kick" and not msg.Special then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 


if msg.content.Fastbots == "messageContact" and not msg.Special then  -- الجهات
local Contact_Group = Redis:get(Fast.."Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الجهات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageVideoNote" and not msg.Special then  -- بصمه الفيديو
local Videonote_Group = Redis:get(Fast.."Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال بصمات الفيديو \n ✓',"md")
end
elseif Videonote_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
elseif Videonote_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
elseif Videonote_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageDocument" and not msg.Special then  -- الملفات
local Document_Group = Redis:get(Fast.."Lock:Document"..msg_chat_id)
if Document_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملفات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageAudio" and not msg.Special then  -- الملفات الصوتيه
local Audio_Group = Redis:get(Fast.."Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصوتيات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageVideo" then  -- الفيديو
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Video_Grouo = Redis:get(Fast.."Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الفيديو \n ✓',"md")
end
end
end

end 
if text and text:match("[A-Z]") or text and text:match("[a-z]") then
if not msg.Special and Redis:get(Fast.."Lock:english"..msg_chat_id) then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال كلمات انكليزيه \n ✓',"md")
end
end
end
if msg.content.Fastbots == "messageVoiceNote" and not msg.Special then  -- البصمات
local Voice_Group = Redis:get(Fast.."Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال البصمات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageSticker" then  -- الملصقات
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Sticker_Group = Redis:get(Fast.."Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الملصقات \n ✓',"md")
end
end
end

end 

if msg.via_bot_user_id ~= 0 and not msg.Admin then  -- انلاين
local Inlen_Group = Redis:get(Fast.."Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الاونلاين \n ✓',"md")
end
end

end

if msg.content.Fastbots == "messageAnimation"  then  -- المتحركات
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Gif_group = Redis:get(Fast.."Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المتحركات \n ✓',"md")
end
end
end

end 
if text and (text:match("ه‍") or text:match("ی") or text:match("ک")) and not msg.Special then 
local phshar_Group = Redis:get(Fast.."Lock:farsia"..msg_chat_id)
if phshar_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الفارسيه \n ✓',"md")
end
end
end
if text and (text:match("كسمك") or text:match("منيوج") or text:match("عير") or text:match("منيوك") or text:match("طويز") or text:match("العيوره") or text:match("مناويج") or text:match("عيوره") or text:match("كسج") or text:match("sex") or text:match("نيج")  or text:match("كحاب")  or text:match("طيازه")or text:match("طيز")or text:match("كس") or text:match("زب") or text:match("نيك") or text:match("فرخ") or text:match("كحبه") or text:match("انيكك") or text:match("منيوك")) and not msg.Special then 
local phshar_Group = Redis:get(Fast.."Lock:phshar"..msg_chat_id)
if phshar_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الفشار \n ✓',"md")
end
end
end
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره باحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) and not msg.Special then 
local phsharr_Group = Redis:get(Fast.."Lock:alkfr"..msg_chat_id)
if phsharr_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الكفر \n ✓',"md")
end
end
end
if msg.content.Fastbots == "messagePhoto" then  -- الصور
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Photo_Group = Redis:get(Fast.."Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الصور \n ✓',"md")
end
end
end

end
if msg.content.photo and Redis:get(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id) then
local ChatPhoto = bot.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.Fastbots == "error") then
Redis:del(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• لا استطيع تغيير صورة الجروب لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم تغيير صورة الجروب بنـجاح ","md",true)    
end
if  (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]")  
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]")
or msg.content.Fastbots == "messageContact" 
or msg.content.Fastbots == "messageSticker"
or msg.content.Fastbots == "messageVideoNote" 
or msg.content.Fastbots == "messageDocument" 
or msg.content.Fastbots == "messageAudio" 
or msg.content.Fastbots == "messageVideo" 
or msg.content.Fastbots == "messageVoiceNote" 
or msg.content.Fastbots == "messageAnimation" 
or msg.content.Fastbots == "messagePhoto" then
local tphlesh_Group = Redis:get(Fast.."Lock:tphlesh"..msg_chat_id)
if not msg.Special and tphlesh_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• عذرا التفليش مقفل تم المسح \n ✓',"md")
end
end
end

if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(Fast.."Lock:Link"..msg_chat_id)  
if not msg.Admin then
if link_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الروابط \n ✓',"md")
end
end

return false
end
end
if text and text:match("@[%a%d_]+") then 
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local UserName_Group = Redis:get(Fast.."Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال المعرفات \n ✓',"md")
end
end

end
end
if text and text:match("#[%a%d_]+") and not msg.Special then 
local Hashtak_Group = Redis:get(Fast.."Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "ked" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "kick" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الهاشتاك \n ✓',"md")
end
end

end
if text and text:match("^/(.*)$") and not msg.Special then 
local comd_Group = Redis:get(Fast.."Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "ked" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "kick" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '• المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'
return send(msg_chat_id,msg_id,Teext..'• ممنوع ارسال الشارحه \n ✓',"md")
end
end
end
if (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صورة'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركة'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, text)  
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true1')
return send(msg_chat_id,msg_id,"\n• ارسل تحذير ( "..Filters.." ) عند ارسالة","md",true)  
end
end
if text and (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true1') then
local Text_Filter = Redis:get(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(Fast.."Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
Redis:del(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"\n• تم اضافه رد التحذير","md",true)  
end
if (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصورة'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركة'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(Fast.."List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(Fast.."Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصورة'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركة'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرسالة'
end
local ReplyFilters = Redis:get(Fast.."Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return send(msg_chat_id,msg_id,"*• لقد تم منع هذه ( "..statusfilter.." ) هنا*\n• "..ReplyFilters,"md",true)   
end
end
if text and Redis:get(Fast..msg.chat_id..msg.sender_id.user_id.."replace") == "true1" then
Redis:del(Fast..msg.chat_id..msg.sender_id.user_id.."replace")
local word = Redis:get(Fast..msg.sender_id.user_id.."word")
Redis:set(Fast.."Word:Replace"..word,text)
Redis:sadd(Fast..'Words:r',word)  
bot.sendText(msg_chat_id,msg_id,"• تم حفظ الكلمه","md",true)  
return false 
end
if text and Redis:get(Fast..msg.chat_id..msg.sender_id.user_id.."replace") == "true" then
Redis:set(Fast..msg.sender_id.user_id.."word",text)
Redis:set(Fast..msg.chat_id..msg.sender_id.user_id.."replace","true1")
bot.sendText(msg_chat_id,msg_id,'\n• ارسل كلمه جديده ليتم استبدالها مكان *'..text..'*',"md",true)  
return false 
end
if text and Redis:get(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
local NewCmmd = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(Fast.."Command:Reids:Group:New"..msg_chat_id)
Redis:srem(Fast.."Command:List:Group"..msg_chat_id,text)
send(msg_chat_id,msg_id,"• تم ازالة هذا الامر ← { "..text.." }","md",true)
else
send(msg_chat_id,msg_id,"• لا يوجد امر بهذا الاسم","md",true)
end
Redis:del(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id)
return false
end
if text and Redis:get(Fast.."Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
Redis:set(Fast.."Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(Fast.."Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id)
Redis:set(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id,"true1") 
return send(msg_chat_id,msg_id,"• ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id) == "true1" then
local NewCmd = Redis:get(Fast.."Command:Reids:Group:New"..msg_chat_id)
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id,text)
Redis:del(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم حفظ الامر باسم ← { "..text..' }',"md",true)
end
if Redis:get(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) then
if text == "الغاء" then
Redis:del(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,"• تم الغاء حفظ الرابط","md",true)         
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup)
Redis:del(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,"• تم حفظ الرابط بنجاح","md",true)         
end
end 
if Redis:get(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
return send(msg_chat_id,msg_id,"• تم الغاء حفظ الترحيب","md",true)   
end 
Redis:del(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
Redis:set(Fast.."Welcome:Group"..msg_chat_id,text) 
return send(msg_chat_id,msg_id,"• تم حفظ ترحيب الجروب","md",true)     
end
if Redis:get(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم الغاء حفظ القوانين","md",true)   
end 
Redis:set(Fast.."Group:Rules" .. msg_chat_id,text) 
Redis:del(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم حفظ قوانين الجروب","md",true)  
end  
if Redis:get(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم الغاء حفظ وصف الجروب","md",true)   
end 
bot.setChatDescription(msg_chat_id,text) 
Redis:del(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"• تم حفظ وصف الجروب","md",true)  
end  

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast.."Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id.."")
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:audio"..msg.content.audio.audio.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:document"..msg.content.document.document.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:video"..msg.content.video.video.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:Photo"..idPhoto..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return send(msg_chat_id,msg_id,"• تم حفظ الرد  بنجاح \n• ارسل ( ["..test.."] ) لعرض الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"• تم مسح الرد من الردود المضافه","md",true)  
return false
end
end
if text and Redis:get(Fast.."Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:Photo"..text)
local video = Redis:get(Fast.."Add:Rd:Sudo:Video"..text)
local document = Redis:get(Fast.."Add:Rd:Sudo:File"..text)
local audio = Redis:get(Fast.."Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',msg.sender_id.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
if Text:match("]") then
send(msg_chat_id,msg_id,Text,"md",true) 
else
send(msg_chat_id,msg_id,"["..Text.."]","md",true) 
end
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(Fast.."Status:Reply"..msg_chat_id) then
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
if Texingt:match("]") then
send(msg_chat_id,msg_id,Texingt,"md",true)  
else
send(msg_chat_id,msg_id,"["..Texingt.."]","md",true)  
end
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
local captionsend = Redis:get(Fast.."Add:Rd:caption:Photo"..photo..msg_chat_id) or ''
bot.sendPhoto(msg.chat_id, msg.id, photo,'['..captionsend..']',"md")
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
local captionsend = Redis:get(Fast.."Add:Rd:caption:video"..video..msg_chat_id) or ''
bot.sendVideo(msg_chat_id, msg.id, video, '['..captionsend..']', "md")
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
local captionsend = Redis:get(Fast.."Add:Rd:caption:document"..document..msg_chat_id) or ''
bot.sendDocument(msg_chat_id, msg.id, document, '['..captionsend..']', 'md')
end  
if audio then
local captionsend = Redis:get(Fast.."Add:Rd:caption:audio"..audio..msg_chat_id) or ''
bot.sendAudio(msg_chat_id, msg.id, audio, '['..captionsend..']',"md")
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast.."Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:Photo"..test, idPhoto)  
end
send(msg_chat_id,msg_id,"• تم حفظ رد للمطور \n• ارسل ( ["..test.."] ) لعرض الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo", text)
return send(msg_chat_id,msg_id,"• تم مسح الرد من الردود العامة","md",true)  
end
end
if Redis:get(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء الاذاعة للمجموعات","md",true)  
end 
local list = Redis:smembers(Fast.."ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(Fast.."PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
Redis:set(Fast.."PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(Fast.."PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(Fast.."PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(Fast.."PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"md",true)
Redis:set(Fast.."PinMsegees:"..v,text)
end
end
send(msg_chat_id,msg_id,"• تمت الاذاعة الى *- "..#list.." * جروب في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end

---
if text == "تفعيل احداث المجموعه" then
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do -- for loop 
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then -- Info_Members
MemberStatusCreator = v.member_id.user_id
end -- Info_Members
end -- for loop 
if tonumber(MemberStatusCreator) == tonumber(msg.sender_id.user_id) or tonumber(Sudo_Id) == tonumber(msg.sender_id.user_id) then
local msg_text = [[
1- قم برفع البوت في المجموعه المراد التخزين بها الاحداث
2- قم برفع البوت ادمن بمجموعه الاحداث
3- تاكد من ان البوت مفعل بمجموعه الاحداث
4- بعد التاكد من كل شئ ارسل ايدي مجموعه الاحداث الان :
( لو مش عارف تجيب ايدي المجموعه : بعد ما تفعل البوت اكتب ايدي المجموعه البوت هيبعتهولك )
]]
Redis:set(Fast..":logger:set_id:"..msg.chat_id..":"..msg.sender_id.user_id, "true")
return send(msg.chat_id,msg.id, msg_text ,"md")
else
return send(msg.chat_id,msg.id, "هذا الامر يخص مالك المجموعه فقط","md")
end
end

if text:match('-100(%d+)') and Redis:get(Fast..":logger:set_id:"..msg.chat_id..":"..msg.sender_id.user_id) then 
if not text:match('-100(%d+)') then
return send(msg.chat_id,msg.id, "برجاء ادخال ايدي المجموعه مبدوء بـ ( -100 )","md")
end
Redis:set(Fast..":logger:chat_id:"..msg.chat_id..":", text)
Redis:del(Fast..":logger:set_id:"..msg.chat_id..":"..msg.sender_id.user_id)
local Info_Chats = bot.getChat(text)
if not Info_Chats.title then
return send(msg.chat_id,msg.id, "برجاء التأكد من رفع البوت مشرف في مجموعه الاحداث","md")
end
local title = Info_Chats.title
return send(msg.chat_id,msg.id, "تم ربط هذه المجموعه الي مجموعه الاحداث ( *"..title.."* )","md")
end

if text == "تعطيل احداث المجموعه" then
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do -- for loop 
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then -- Info_Members
MemberStatusCreator = v.member_id.user_id
end -- Info_Members
end -- for loop 
if tonumber(MemberStatusCreator) == tonumber(msg.sender_id.user_id)  or tonumber(Sudo_Id) == tonumber(msg.sender_id.user_id) then
Redis:del(Fast..":logger:chat_id:"..msg.chat_id..":")
return send(msg.chat_id,msg.id, "تم تعطيل احداث المجموعه بنجاح" ,"md")
else
return send(msg.chat_id,msg.id, "هذا الامر يخص مالك المجموعه فقط","md")
end
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء الاذاعة خاص","md",true)  
end 
local list = Redis:smembers(Fast..'Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"md",true)
end
end
send(msg_chat_id,msg_id,"• تمت الاذاعة الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء الاذاعة للمجموعات","md",true)  
end 
local list = Redis:smembers(Fast.."ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"md",true)
end
end
send(msg_chat_id,msg_id,"• تمت الاذاعة الى *- "..#list.." * جروب في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء الاذاعة بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."ChekBotAdd")   
send(msg_chat_id,msg_id,"• تم التوجيه الى *- "..#list.." * جروب في البوت ","md",true)      
for k,v in pairs(list) do  
bot.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء الاذاعة بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."Num:User:Pv")   
send(msg_chat_id,msg_id,"• تم التوجيه الى *- "..#list.." * جروب في البوت ","md",true) 
for k,v in pairs(list) do  
bot.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
if text and Redis:get(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id) then
if text == 'الغاء' or text == 'الغاء الامر •' then 
Redis:del(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'• تم الغاء حفظ رسالة المطور')
end
Redis:set(Fast..'Texting:DevFast',text)
Redis:del(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'• تم حفظ رسالة المطور')
end
if Redis:get(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
send(msg_chat_id,msg_id, "\n• تم الغاء امر تعيين الايدي","md",true)  
Redis:del(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,text:match("(.*)"))
send(msg_chat_id,msg_id,'• تم تعيين الايدي الجديد',"md",true)  
end
if Redis:get(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
send(msg_chat_id,msg_id, "\n• تم الغاء امر تعيين الايدي","md",true)  
Redis:del(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(Fast.."Set:Id:Groups",text:match("(.*)"))
send(msg_chat_id,msg_id,'• تم تعيين الايدي الجديد عام',"md",true)  
end
if Redis:get(Fast.."Change:Name:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Change:Name:Bot"..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء امر تغير اسم البوت","md",true)  
end 
Redis:del(Fast.."Change:Name:Bot"..msg.sender_id.user_id) 
Redis:set(Fast.."Name:Bot",text) 
return send(msg_chat_id,msg_id, "• تم تغير اسم البوت الى - "..text,"md",true)    
end 
if Redis:get(Fast.."Change:Start:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."Change:Start:Bot"..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n• تم الغاء امر تغير رسالة start","md",true)  
end 
Redis:del(Fast.."Change:Start:Bot"..msg.sender_id.user_id) 
Redis:set(Fast.."Start:Bot",text) 
return send(msg_chat_id,msg_id, "• تم تغيير رسالة start - "..text,"md",true)    
end 

-------*****************-------*****************-------*****************

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:sadd(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم حفظ السؤال بنجاح')
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:srem(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم مسح السؤال بنجاح')
end
end
if msg.content.audio then  
if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,msg.content.audio.audio.remote.id)  
Redis:sadd(Fast.."audio:Games:Bot",msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
return send(msg.chat_id, msg.id,'• ارسل اسم الموسيقى الان ...')
end   
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
local Id_audio = Redis:get(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:set(Fast..'Text:Games:audio'..Id_audio,text)
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id,'• تم حفظ الصوت ')
end

if Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) then
if text == ""..(Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) or '66765$47').."" then 
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
return send(msg.chat_id,msg.id,'*• الف مبروك اجابتك صحيحه تم اضافه لك 5 نقاط*')
end
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."All:text:Games:Bot",text) then
send(msg_chat_id,msg_id,'• لا يوجد صوتيه بهذا الاسم في العامة')
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."All:audio:Games"..text)
Redis:srem(Fast.."All:text:Games:Bot",text)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم مسح الصوتيه بنجاح')
return false
end

if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast..'All:Text:Games:audio'..msg.chat_id,text)
Redis:sadd(Fast.."All:text:Games:Bot",text)  
Redis:set(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
send(msg_chat_id,msg_id,'• الان ارسل الصوتيه ليتم حفظها باسم  : '..text)
return false
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'All:Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."All:audio:Games"..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."All:audio:Games"..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."text:Games:Bot"..msg.chat_id,text) then
send(msg_chat_id,msg_id,'• لا يوجد صوتيه بهذا الاسم في الجروب')
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."audio:Games"..msg.chat_id..text)
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,text)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم مسح الصوتيه بنجاح')
return false
end


if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."audio:Games"..msg.chat_id..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'• تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."audio:Games"..msg.chat_id..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم مسح السؤال بنجاح') 
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم حفظ السؤال بنجاح \n ارسل الجواب الاول') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true4")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الرابع') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true4" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as0"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return send(msg_chat_id,msg_id, '\nتم حفظ الاجوبه \n ارسل الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
send(msg_chat_id,msg_id, '\nتم مسح الغز بنجاح')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
send(msg_chat_id,msg_id, '\nتم حفظ اللغز بنجاح \n ارسل الجواب الاول')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return false 
end
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Bots"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫: نسبة الحب بيـن : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Bots"..msg.chat_id)
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Bottts"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫: نسبة الغباء  : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Bottts"..msg.chat_id)
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Botttuus"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫: نسبة الذكاء  : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Botttuus"..msg.chat_id)
end
if text and Redis:get(Fast..":"..msg.sender_id.user_id..":krh_Bots"..msg.chat_id) == "sendkrhe" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '⌯ اليك النتائج الخـاصة :\n\n⌯ نسبه الكرة : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":krh_Bots"..msg.chat_id)
end
if text and text ~="نسبه الرجوله" and Redis:get(Fast..":"..msg.sender_id.user_id..":rjo_Bots"..msg.chat_id) == "sendrjoe" then
numj = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","🥰 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫:  نسبة الرجوله لـ : *'..text..'* '..sendnuj..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":rjo_Bots"..msg.chat_id)
end
if text and text ~="نسبه الانوثه" and Redis:get(Fast..":"..msg.sender_id.user_id..":ano_Bots"..msg.chat_id) == "sendanoe" then
numj = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","?? 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫:  نسبه الانوثة لـ : *'..text..'* '..sendnuj..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":ano_Bots"..msg.chat_id)
end


if text == "مسح قائمه المنع عام" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*• لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(Fast.."All:Filter:Group:"..v)  
Redis:srem(Fast.."All:List:Filter",v)  
end  
return send(msg_chat_id,msg_id,"*• تم مسح ("..#list..") كلمات ممنوعه *","md",true)   
end
if text == "قائمه المنع عام" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:List:Filter")  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*• لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
Filter = '\n*• قائمه المنع \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k,v in pairs(list) do  
if v:match('photo:(.*)') then
ver = 'صورة'
elseif v:match('animation:(.*)') then
ver = 'متحركة'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(Fast.."All:Filter:Group:"..v)   
Filter = Filter.."*"..k.."- "..ver.." » { "..Text_Filter.." }*\n"    
end  
send(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع عام" then       
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true')
return send(msg_chat_id,msg_id,'\n*• ارسل الان { ملصق ,متحركة ,صورة ,رسالة } *',"md",true)  
end    
if text == "الغاء منع عام" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'DelFilterq')
return send(msg_chat_id,msg_id,'\n*• ارسل الان { ملصق ,متحركة ,صورة ,رسالة } *',"md",true)  
end
if (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صورة'
Redis:sadd(Fast.."All:List:Filter",'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركة'
Redis:sadd(Fast.."All:List:Filter",'animation:'..msg.content.animation.animation.id)  
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(Fast.."All:List:Filter",'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, text)  
Redis:sadd(Fast.."All:List:Filter",'text:'..text)  
Filters = 'نص'
end
Redis:set(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true1')
return send(msg_chat_id,msg_id,"\n• ارسل تحذير ( "..Filters.." ) عند ارسالة","md",true)  
end
end
if text and (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true1') then
local Text_Filter = Redis:get(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(Fast.."All:Filter:Group:"..Text_Filter,text)  
end  
Redis:del(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
Redis:del(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"\n• تم اضافه رد التحذير","md",true)  
end

if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصورة'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركة'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرسالة'
end
local ReplyFilters = Redis:get(Fast.."All:Filter:Group:"..DelFilters)
if ReplyFilters and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return send(msg_chat_id,msg_id,"*• لقد تم منع هذه ( "..statusfilter.." ) هنا*\n• "..ReplyFilters,"md",true)   
end
end

if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name

local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
var(File)
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(Fast) ~= tonumber(FilesJson.BotId) then
return send(msg_chat_id,msg_id,'• عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end botid
send(msg_chat_id,msg_id,'• جاري استرجاع المشتركين والجروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(Fast..'Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(Fast.."ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(Fast.."SuperCreator:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(Fast.."Creator:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(Fast.."Manger:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(Fast.."Admin:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(Fast.."Special:Group"..GroupId,v)
end
end 
end
return send(msg_chat_id,msg_id,'• تم استرجاع {'..X..'} جروب \n• واسترجاع {'..Y..'} مشترك في البوت')
end
end
if text == 'رفع نسخه تشاكي' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(Fast) then 
return send(msg_chat_id,msg_id,'• عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(Fast.."ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(Fast.."Creator:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(Fast.."Manger:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(Fast.."Admin:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(Fast.."SuperCreator:Group"..idg,idASAS)
end;end
end
return send(msg_chat_id,msg_id,'• تم استرجاع المجموعات من نسخه تشاكي')
else
return send(msg_chat_id,msg_id,'• الملف لا يدعم هذا البوت')
end
end
end

if (Redis:get(Fast.."AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر •' then   
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
return send(msg_chat_id,msg_id, "\n• تم الغاء امر تغيير المطور الاساسي","md",true)    
end 
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
send(msg_chat_id,msg_id,"\n• تم تغيير المطور الاساسي اصبح على : [@"..text:gsub('@','').."]","md",true)  
dofile('Fast.lua')  
return false
end
end

if text == 'تغيير المطور الاساسي' or text == '• تغيير المطور الاساسي' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then 
Redis:set(Fast.."AddSudosNew"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"• ارسل معرف المطور الاساسي مع @........","md",true)
else
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true) 
end
end

if text == 'تحديث السورس' or text == 'تحديث السورس •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
os.execute('rm -rf Fast.lua')
download('http://195.35.24.60/AHMED/Fast.lua','Fast.lua')
return send(msg_chat_id,msg_id,'\n*• تم تحديث السورس * ',"md",true)  
end
if text == 'معلومات التنصيب' or text == 'معلومات التنصيب •' then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then 
return send(msg_chat_id,msg_id,'\n\n• التوكن : `'..Token..'`\n\n• معرف البوت : [@'..UserBot..']\n\n• ايدي المطور : `'..Sudo_Id..'`\n\n• معرف المطور : [@'..UserSudo..']',"md",true)  
else
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true) 
end
end
if text == "ضع صورة للترحيب" or text == "ضع صورة للترحيب •" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:setex(Fast..'welcom_ph:witting'..senderr,300,true) 
return send(msg_chat_id,msg_id, '• حسننا عزيزي \n• ︙الان قم بارسال الصورة للترحيب \n' )
end


if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'*• عدد احصائيات البوت الكامله \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n• عدد المجموعات : '..(Redis:scard(Fast..'ChekBotAdd') or 0)..'\n• عدد المشتركين : '..(Redis:scard(Fast..'Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تفعيل' and msg.Dev then
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(Fast..'Num:Add:Bot') or 0)) and not msg.Asasy then
return send(msg_chat_id,msg_id,'• عدد الاعضاء قليل لا يمكن تفعيل الجروب  يجب ان يكون اكثر من :'..Redis:get(Fast..'Num:Add:Bot'),"md",true)  
end
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,'\n*• الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n• تم تفعيلها مسبقا *',"md",true)  
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = senderr..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =senderr..'/LockAllGroup@'..msg_chat_id},{text = '- ترتيب الاوامر', data = senderr..'/trtep@'..msg_chat_id},
},
}
}
if not msg.Asasy then
local UserInfo = bot.getUser(senderr)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n• تم تفعيل جروب جديده \n• من قام بتفعيلها : {*['..FlterBio(UserInfo.first_name)..'](tg://user?id='..senderr..')*} \n• معلومات الجروب :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'*\n• ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n• `'..msg_chat_id..'`',"md",true, false, false, false, reply_markup)
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,v.member_id.user_id) 
end
end
end
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast.."Status:Link"..msg_chat_id,true) 
Redis:set(Fast.."Status:Games"..msg_chat_id,true) 
Redis:set(Fast.."AlThther:Chat"..msg.chat_id,"true")
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:set(Fast.."Status:Welcome"..msg_chat_id,true) 
Redis:set(Fast.."AlThther:Chat"..msg.chat_id,"true")
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast.."Status:Id"..msg_chat_id,true) ;Redis:set(Fast.."Status:Reply"..msg_chat_id,true) ;Redis:set(Fast.."Status:ReplySudo"..msg_chat_id,true) ;Redis:set(Fast.."Status:BanId"..msg_chat_id,true) ;Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,'\n*• الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n• تم تفعيل الجروب *','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Dev then
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if Redis:sismember(Fast..'Black:listBan:',msg_chat_id) then
return send(msg_chat_id,msg_id,"\n*• عذرآ الجروب محظوره من التفعيل *","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return send(msg_chat_id,msg_id,"\n*• عذرا انته لست ادمن او مالك الجروب *","md",true)  
end
if not Redis:get(Fast.."BotFree") then
return send(msg_chat_id,msg_id,"\n*• الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(Fast..'Num:Add:Bot') or 0)) and not msg.Asasy then
return send(msg_chat_id,msg_id,'• عدد الاعضاء قليل لا يمكن تفعيل الجروب  يجب ان يكون اكثر من :'..Redis:get(Fast..'Num:Add:Bot'),"md",true)  
end
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,'\n*• الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n• تم تفعيلها مسبقا *',"md",true)  
else
if not msg.Asasy then
local UserInfo = bot.getUser(senderr)

local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n• تم تفعيل جروب جديده \n• من قام بتفعيلها : {*['..FlterBio(UserInfo.first_name)..'](tg://user?id='..senderr..')*} \n• معلومات الجروب :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'*\n• ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n• `'..msg_chat_id..'`',"md",true, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = senderr..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =senderr..'/LockAllGroup@'..msg_chat_id},{text = '- ترتيب الاوامر', data = senderr..'/trtep@'..msg_chat_id},
},
}
}
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,v.member_id.user_id) 
end
end
end
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast.."Status:Link"..msg_chat_id,true) 
Redis:set(Fast.."Status:Games"..msg_chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:set(Fast.."AlThther:Chat"..msg.chat_id,"true")
Redis:set(Fast.."Status:Welcome"..msg_chat_id,true) 
Redis:set(Fast.."AlThther:Chat"..msg.chat_id,"true")
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast.."Status:Id"..msg_chat_id,true) ;Redis:set(Fast.."Status:Reply"..msg_chat_id,true) ;Redis:set(Fast.."Status:ReplySudo"..msg_chat_id,true) ;Redis:set(Fast.."Status:BanId"..msg_chat_id,true) ;Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,'\n*• الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n• تم تفعيل الجروب *','md', true, false, false, false, reply_markup)
end
end

if text == 'تعطيل' and msg.Dev then
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,'\n*• الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n• تم تعطيلها مسبقا *',"md",true)  
else
if not msg.Asasy then
local UserInfo = bot.getUser(senderr)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n• تم تعطيل جروب جديده \n• من قام بتعطيلها : {*['..FlterBio(UserInfo.first_name)..'](tg://user?id='..senderr..')*} \n• معلومات الجروب :\n• عدد الاعضاء : '..Info_Chats.member_count..'\n• عدد الادمنيه : '..Info_Chats.administrator_count..'\n• عدد المطرودين : '..Info_Chats.banned_count..'\n• عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(Fast.."ChekBotAdd",msg_chat_id)
return send(msg_chat_id,msg_id,'\n*• الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n• تم تعطيلها بنجاح *','md',true)
end
end

if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 

if text then
local GetMsg = Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 
Redis:hset(Fast..':GroupUserCountMsg:'..msg.chat_id,senderr,GetMsg)
local UserInfo = bot.getUser(senderr) 
if FlterBio(UserInfo.first_name) then
NameLUser = FlterBio(UserInfo.first_name)
else
NameLUser = FlterBio(UserInfo.first_name)
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(Fast..':GroupNameUser:'..msg.chat_id,senderr,NameLUser)
end



if text == "ترند" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
GroupAllRtba = Redis:hgetall(Fast..':GroupUserCountMsg:'..msg.chat_id)
GetAllNames  = Redis:hgetall(Fast..':GroupNameUser:'..msg.chat_id)
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = " الاكثر تفاعلا هو : \n\n"
for k,v in ipairs(GroupAllRtbaL) do
if i <= Count then  Text = Text..i.."ـ ["..(GetAllNames[v[2]] or "خطأ بالأسـم").."](tg://user?id="..v[2]..") ـ~> {*"..v[1].."*}  \n" end ; i=i+1
end
return send(msg.chat_id,msg.id,Text,"md")
end


if text and text:match('^ذيع (-100%d+)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local Chatid = text:match('^ذيع (-100%d+)$') 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
send(Chatid,0,Message_Reply.content.text.text)
send(msg_chat_id,msg_id,'- تم الاذاعة الى  : '..Get_Chat.title..'\n ')
end 



if text and text:match('^حظر جروب (-100%d+)$') then
local Chatid = text:match('^حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
bot.leaveChat(Chatid)
Redis:sadd(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم حظر الجروب  : ['..Get_Chat.title..']\n - وتم مغادره البوت من الجروب')
end 
if text and text:match('^الغاء حظر جروب (-100%d+)$') then
local Chatid = text:match('^الغاء حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:srem(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم الغاء حظر الجروب ')
end 


if text == "الساعه" or text == "الوقت" then
local ramsesj20 = "\n الساعه الان : "..https.request("https://xnxx.fastbots.ml/apies/time.php")
send(msg_chat_id,msg_id,ramsesj20)
end

if text == "التاريخ" then
local ramsesj20 =  "\n التاريخ : "..os.date("%Y/%m/%d")
send(msg_chat_id,msg_id,ramsesj20)
end



if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return send(msg_chat_id,msg_id,"\n*↯︙ لا تستطيع كتم ↫ "..Controller(msg_chat_id,UserId_Info.id).." *","md",true)    
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,"\n*↯︙ لا تستطيع كتم ↫ "..Controller(msg_chat_id,UserId_Info.id).." *","md",true)    
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," •تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == "الغاء امر رفع ثانوي" then 
  local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
  local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
  Redis:set(Fast..msg.chat_id.."creative:", UserInfo.id) 
  return send(msg.chat_id,msg.id,Reply_Status( rep_idd,"تم الغاء امر رفع ثانوي").Reply,"md",true)
  end
  


  if text == "اضافة امر رفع ثانوي" then 
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
    Redis:del(Fast..msg.chat_id.."creative:", UserInfo.id) 
    return send(msg.chat_id,msg.id,Reply_Status( rep_idd,"تم اضافة امر رفع  مطور").Reply,"md",true)
    end

    if text == "الغاء امر رفع مطور" then 
      local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
      local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
      Redis:set(Fast..msg.chat_id.."messi:", UserInfo.id) 
      return send(msg.chat_id,msg.id,Reply_Status( rep_idd,"تم الغاء امر رفع مطور").Reply,"md",true)
      end

      if text == "اضافة امر رفع مطور" then 
        local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
        local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
        Redis:del(Fast..msg.chat_id.."messi:", UserInfo.id) 
        return send(msg.chat_id,msg.id,Reply_Status( rep_idd,"تم اضافة امر رفع  مطور").Reply,"md",true)
        end

        if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
          if not msg.Devss then
          return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
          end
          local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
          local UserInfo = bot.getUser(rep_idd)
          if UserInfo.message == "Invalid user ID" then
          return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
          end
          if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
          return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
          end
          if Controllerbanall(msg_chat_id,rep_idd) == true then 
          return send(msg_chat_id,msg_id,"\n*↯︙ لا تستطيع كتم ↫ "..Controller(msg_chat_id,rep_idd).." *","md",true)    
          end
          if StatusSilent(msg_chat_id,rep_idd) == true then
          return send(msg_chat_id,msg_id,"\n*↯︙ لا تستطيع كتم ↫ "..Controller(msg_chat_id,rep_idd).." *","md",true)    
          end
          if Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
          return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
 else
 Redis:sadd(Fast.."KtmAll:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," •تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) then 
return send(msg_chat_id,msg_id,"\n*↯︙ لا تستطيع كتم ↫ "..Controller(msg_chat_id,UserId).."  *","md",true) 
end
if StatusSilent(msg_chat_id,UserId) then
return send(msg_chat_id,msg_id,"\n*↯︙ لا تستطيع كتم ↫ "..Controller(msg_chat_id,UserId).."  *","md",true) 
end 
if Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام (%d+)$') then
local UserId = text:match('^الغاء كتم عام (%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId) 
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId," •تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end

if text == 'مسح المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," •لا يوجد مكتومين عام حاليا , ","md",true)  
end
Redis:del(Fast.."KtmAll:Groups") 
return send(msg_chat_id,msg_id,"* •تم مسح {"..#Info_Members.."} من المكتومين عام *","md",true)
end

if text == 'المكتومين عام' or text == 'قائمه المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," •لا يوجد مكتومين عام حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه المكتومين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المكتومين عام', data = senderr..'/KtmAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end

if text == 'مطور' then  
local UserId_Info = bot.searchPublicChat(devsource)
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local TestText = "- معلومات مطور السورس : \n\n- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url='http://t.me/'..chsource..''},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "- معلومات مطور السورس : \\nn- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url='http://t.me/'..chsource..''},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end

if text == 'المطور' or text == 'مطور البوت' then   
local UserInfo = bot.getUser(Sudo_Id) 
local InfoUser = bot.getUserFullInfo(Sudo_Id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = "- معلومات مالك البوت : \n\n- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..Sudo_Id..")\n\n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown')  
else
local TestText = "- معلومات مالك البوت : \\nn- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..Sudo_Id..")\n\n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
if Redis:get(Fast..'Set:array'..senderr..':'..msg_chat_id) == 'true1' then
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
local test = Redis:get(Fast..'Text:array'..senderr..':'..msg_chat_id..'')
Redis:sadd(Fast.."Add:Rd:array:Text"..test,text)  
_key = {
{{text="اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..senderr}},
}
send_inlin_key(msg_chat_id,' * •تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل *',_key,msg_id)
return false  
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'dttd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
gery = Redis:get(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast.."Add:Rd:array:Text"..gery,text) then
send(msg_chat_id, msg_id,' * •لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:srem(Fast.."Add:Rd:array:Text"..gery,text)
send(msg_chat_id, msg_id,' * •تم حذفه بنجاح .* ',"md",true)
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast..'List:array',text) then
send(msg_chat_id, msg_id,' * •لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:set(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id,text)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"dttd")
send(msg_chat_id, msg_id,' * •قم بارسال الرد الذي تريد حذفه منه* ',"md",true)
return false
end
end
if text == "حذف رد من متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:get(Fast.."Set:array"..senderr..":"..msg_chat_id) == 'true' then
Redis:sadd(Fast..'List:array', text)
Redis:set(Fast..'Text:array'..senderr..':'..msg_chat_id, text)
send(msg_chat_id, msg_id,'ارسل الرد الذي تريد اضافته',"md",true)
Redis:del(Fast.."Set:array"..senderr..":"..msg_chat_id)
Redis:set(Fast..'Set:array'..senderr..':'..msg_chat_id,'true1')
Redis:del(Fast.."Add:Rd:array:Text"..text)   
return false
end
end

if text then
if Redis:get(Fast.."Set:array:rd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:rd"..senderr..":"..msg_chat_id)
Redis:del(Fast.."Add:Rd:array:Text"..text)
Redis:srem(Fast..'List:array', text)
send(msg_chat_id, msg_id,' * •تم ازالة الرد المتعدد بنجاح* ',"md",true)
return false
end
end

if text == "حذف رد متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:rd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if  Redis:sismember(Fast..'List:array',text) then
local list = Redis:smembers(Fast.."Add:Rd:array:Text"..text)
quschen = list[math.random(#list)]
send(msg_chat_id, msg_id,'['..quschen..']',"md",true)
end
end
if text == ("الردود المتعدده") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
text = "  •قائمه الردود المتعدده \n• ━━━━ Fast ━━━━━• \n"
for k,v in pairs(list) do
text = text..""..k..">> ("..v..") » {رسالة}\n"
end
if #list == 0 then
text = "  •لا يوجد ردود متعدده"
end
send(msg_chat_id, msg_id,'['..text..']',"md",true)
end
if text == ("مسح الردود المتعدده") then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:array:Text"..v..msg_chat_id)   
Redis:del(Fast..'List:array'..msg_chat_id)
end
send(msg_chat_id, msg_id," * •تم مسح الردود المتعدده*","md",true)
end
if text == "اضف رد متعدد" then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"• ارسل الكلمه التي تريد اضافتها",inlin,msg_id)
Redis:set(Fast.."Set:array"..senderr..":"..msg_chat_id,true)
return false
end

if text == 'السيرفر' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
send(msg_chat_id,msg_id, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '• •⊱ { نظام التشغيل } ⊰• \n*»» '"$linux_version"'*' 
echo '*------------------------------\n*• •⊱ { الذاكره العشوائيه } ⊰• \n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*• •⊱ { وحـده الـتـخـزيـن } ⊰• \n*»» '"$HardDisk"'*'
echo '*------------------------------\n*• •⊱ { الـمــعــالــج } ⊰• \n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*• •⊱ { الــدخــول } ⊰• \n*»» '`whoami`'*'
echo '*------------------------------\n*• •⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰• \n*»» '"$uptime"'*'
]]):read('*all'),"md")
end

if text == 'صلاحياتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"• الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"• الصلاحيات : عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,senderr).status 
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local PermissionsUserr = '*\n• صلاحيات المستخدم :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,"• الصلاحيات : مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end
if text == 'صلاحياته' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local StatusMember = bot.getChatMember(msg_chat_id,rep_idd).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"• الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"• الصلاحيات : عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local PermissionsUserr = '*\n• صلاحيات المستخدم :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,"• الصلاحيات : مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end


if text and text:match('^صلاحياته @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^صلاحياته @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,UserId_Info.id).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"• الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"• الصلاحيات : عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local PermissionsUserr = '*\n• صلاحيات المستخدم :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,"• الصلاحيات : مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end
if text and text:match('^التفاعل @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^التفاعل @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,"• التفاعل : "..TotalMsgT, "md")
end
if text == 'التفاعل' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,"• التفاعل : "..TotalMsgT, "md")
end


if text and text:match('^الرتبه @(%S+)$') then
local UserName = text:match('^الرتبه @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId_Info.id) or Controller(msg_chat_id,UserId_Info.id)
return send(msg_chat_id,msg_id,"• الرتبه : "..RinkBot, "md")
end
if text == 'الرتبه' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..rep_idd) or Controller(msg_chat_id,rep_idd)
return send(msg_chat_id,msg_id,"• الرتبه : "..RinkBot, "md")
end

if text == "ايدي" and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n•عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n•عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Id"..msg_chat_id) then
return false
end
if not Redis:get(Fast.."like:id:"..msg.chat_id) then
if not Redis:sismember(Fast.."like:user:", msg.sender_id.user_id) then
Redis:sadd(Fast.."like:user:", msg.sender_id.user_id)
end
local like_num = Redis:smembers(Fast.."like:users:"..msg.sender_id.user_id)
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
Id_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = #like_num.." "..emo , data = msg.sender_id.user_id.."/likeId/"..#like_num}, 
},
}
}
else
Id_markup = nil
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local InfoUser = bot.getUserFullInfo(msg.sender_id.user_id)
if InfoUser.bio then
Bio = FlterBio(InfoUser.bio)
else
Bio = 'لا يوجد'
end
local nameuser = FlterBio(UserInfo.first_name)
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
local UserId = msg.sender_id.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) or 0
local Texting = {
  "بحبك 🥺♥.!",
  "وشك دا ولا وش رجل 😂",
  "صورة قمر زي صاحبها 🥺♥.!",
  "لاقيمة للقمر امام وجهك",
  "وشك دا ولا القمر 🙈♥.!",
  "هم في الارض وانت بين النجوم 🤍🎀.!",
  "احلا ايدي"
}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '[@'..UserInfo.username..']'
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(Fast.."Set:Id:Groups") or Redis:get(Fast.."Set:Id:Group"..msg_chat_id)
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender_id.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio)
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'\n*•ايديك : ❪'..UserId..
'❫\n•معرفك : ❪*['..UserInfousername..
']*❫\n•رتبتك : ❪'..RinkBot..
'❫\n•رسائلك : ❪'..TotalMsg..
'❫\n•سحكاتك : ❪'..TotalEdit..
'❫\n•تفاعلك : ❪'..TotalMsgT..
'❫\n•البايو : ❪*['..Bio..
']*❫*', "md",true, false, false, false, Id_markup)
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id,'md', true, nil, nil, nil, nil, nil, nil, nil, nil, Id_markup)
else
return send(msg_chat_id,msg_id,Get_Is_Id,"md",true, false, false, false, Id_markup) 
end
else
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'\n*•ايديك : ❪'..UserId..
'❫\n•معرفك : ❪*['..UserInfousername..
']*❫\n•رتبتك : ❪'..RinkBot..
'❫\n•رسائلك : ❪'..TotalMsg..
'❫\n•سحكاتك : ❪'..TotalEdit..
'❫\n•تفاعلك : ❪'..TotalMsgT..
'❫\n•البايو : ❪*['..Bio..
']*❫*', "md", true, false, false, false, Id_markup)
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n↫ '..Description..
'\n•ايديك : ❪ '..UserId..
' ❫\n•معرفك : ❪ ['..UserInfousername..
'] ❫\n•رتبتك : ❪ '..RinkBot..
'❫\n•رسائلك : ❪ '..TotalMsg..
' ❫\n•نقاطك : ❪ '..NumberGames..
' ❫\n•سحكاتك : ❪ '..TotalEdit..
' ❫\n•تفاعلك : ❪ '..TotalMsgT..
'❫\n•البايو : ❪ ['..Bio..
']❫', "md", true, nil, nil, nil, nil, nil, nil, nil, nil, Id_markup)
else
return send(msg_chat_id,msg_id,
'\n*•ايديك : ❪'..UserId..
'❫\n•معرفك : ❪*['..UserInfousername..
']*❫\n•رتبتك : ❪'..RinkBot..
'❫\n•رسائلك : ❪'..TotalMsg..
'❫\n•سحكاتك : ❪'..TotalEdit..
'❫\n•تفاعلك : ❪'..TotalMsgT..
'❫\n•البايو : ❪*['..Bio..
']*❫*', "md",true, false, false, false, Id_markup)
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender_id.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
return send(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true, false, false, false, Id_markup) 
else
return send(msg_chat_id,msg_id,
'\n*•ايديك : ❪'..UserId..
'❫\n•معرفك : ❪*['..UserInfousername..
']*❫\n•رتبتك : ❪'..RinkBot..
'❫\n•رسائلك : ❪'..TotalMsg..
'❫\n•سحكاتك : ❪'..TotalEdit..
'❫\n•تفاعلك : ❪'..TotalMsgT..
'❫\n•البايو : ❪*['..Bio..
']*❫*', "md",true, false, false, false, Id_markup)
end
end
end 


if text and text:match('^تحكم @(%S+)$') then
local UserName = text:match('^تحكم @(%S+)$') 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,UserId_Info.id) 
Creator = Redis:sismember(Fast.."Creator:Group"..msg.chat_id,UserId_Info.id)
Manger = Redis:sismember(Fast.."Manger:Group"..msg.chat_id,UserId_Info.id)
Admin = Redis:sismember(Fast.."Admin:Group"..msg.chat_id,UserId_Info.id)
Special = Redis:sismember(Fast.."Special:Group"..msg.chat_id,UserId_Info.id)
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..msg.chat_id,UserId_Info.id)
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,UserId_Info.id)
if BanGroup then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if SilentGroup then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if SuperCreator then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Creator then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Manger then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Admin then
Adminz = "✔"
else
Adminz = "❌"
end
if Special then
Specialz = "✔"
else
Specialz = "❌"
end

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =senderr..'/statusSuperCreatorz/'..UserId_Info.id},{text = '- منشئ : '..Creatorz, data =senderr..'/statusCreatorz/'..UserId_Info.id},
},
{
{text = '- مدير : '..Mangerz, data =senderr..'/statusMangerz/'..UserId_Info.id},{text = '- ادمن : '..Adminz, data =senderr..'/statusAdminz/'..UserId_Info.id},
},
{
{text = '- مميز : '..Specialz, data =senderr..'/statusSpecialz/'..UserId_Info.id},
},
{
{text = '- الحظر : '..BanGroupz, data =senderr..'/statusban/'..UserId_Info.id},{text = '- الكتم : '..SilentGroupz, data =senderr..'/statusktm/'..UserId_Info.id},
},
{
{text = '- عضو  ', data =senderr..'/statusmem/'..UserId_Info.id},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return send(msg.chat_id,msg.id,'*\n• تحكم برتب الشخص*',"md",false, false, false, false, reply_markup)
end
if text == 'تحكم' and msg.reply_to_message_id > 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,rep_idd) 
Creator = Redis:sismember(Fast.."Creator:Group"..msg.chat_id,rep_idd)
Manger = Redis:sismember(Fast.."Manger:Group"..msg.chat_id,rep_idd)
Admin = Redis:sismember(Fast.."Admin:Group"..msg.chat_id,rep_idd)
Special = Redis:sismember(Fast.."Special:Group"..msg.chat_id,rep_idd)
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..msg.chat_id,rep_idd)
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,rep_idd)
if BanGroup then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if SilentGroup then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if SuperCreator then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Creator then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Manger then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Admin then
Adminz = "✔"
else
Adminz = "❌"
end
if Special then
Specialz = "✔"
else
Specialz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =senderr..'/statusSuperCreatorz/'..rep_idd},{text = '- منشئ : '..Creatorz, data =senderr..'/statusCreatorz/'..rep_idd},
},
{
{text = '- مدير : '..Mangerz, data =senderr..'/statusMangerz/'..rep_idd},{text = '- ادمن : '..Adminz, data =senderr..'/statusAdminz/'..rep_idd},
},
{
{text = '- مميز : '..Specialz, data =senderr..'/statusSpecialz/'..rep_idd},
},
{
{text = '- الحظر : '..BanGroupz, data =senderr..'/statusban/'..rep_idd},{text = '- الكتم : '..SilentGroupz, data =senderr..'/statusktm/'..rep_idd},
},
{
{text = '- عضو  ', data =senderr..'/statusmem/'..rep_idd},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return send(msg.chat_id,msg.id,'*\n• تحكم برتب الشخص*',"md",false, false, false, false, reply_markup)
end
if text == 'ايدي' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local InfoUser = bot.getUserFullInfo(rep_idd)
if InfoUser.bio then
Bio = FlterBio(InfoUser.bio)
else
Bio = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..rep_idd) or Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'\n*• ايديك : ❪'..UserId..
'❫\n• معرفك : ❪*['..UserInfousername..
']*❫\n• رتبتك : ❪'..RinkBot..
'❫\n• رسائلك : ❪'..TotalMsg..
'❫\n• تعديلاتك : ❪'..TotalEdit..
'❫\n• تفاعلك : ❪'..TotalMsgT..
'❫\n• البايو : ❪*['..Bio..
']*❫*', "md")
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n*• ايديه : '..UserId..
'\n• معرفه : '..UserInfousername..
'\n• رتبته : '..RinkBot..
'\n• رسائله : '..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• تفاعله : '..TotalMsgT..
'*', "md")
else
return send(msg_chat_id,msg_id,
'\n*• ايديه : '..UserId..
'\n• معرفه : '..UserInfousername..
'\n• رتبته : '..RinkBot..
'\n• رسائله : '..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• تفاعله : '..TotalMsgT..
'*',"md",true) 
end
else
return send(msg_chat_id,msg_id,
'\n*• ايديه : '..UserId..
'\n• معرفه : '..UserInfousername..
'\n• رتبته : '..RinkBot..
'\n• رسائله : '..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• تفاعله : '..TotalMsgT..
'*',"md",true) 
end
end

if text and text:match('^كشف (%d+)$') then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId = text:match('^كشف (%d+)$')
local UserInfo = bot.getUser(UserId)
if UserInfo.username then
UserName = '@'..UserInfo.username..''
else
UserName = 'لا يوجد'
end
local Name_User = FlterBio(UserInfo.first_name)
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId) or Controller(msg_chat_id,UserId)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..UserId) or 0
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..UserId) or 0
if UserInfo.Fastbots  == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end 
return send(msg_chat_id,msg_id,
'◂ اسمه ↫ '..Name_User..
'\n◂ ايديه ↫ '..UserId..
'\n◂ معرفه ↫ ['..UserName..']'..
'\n◂ رتبته ↫ '..RinkBot..
'\n◂ عدد رسايله ↫ '..TotalMsg..
'\n◂ عدد تعديلاته ↫ '..TotalEdit..
'\n◂ تفاعله ↫ '..TotalMsgT..
'\n◂ البايو ↫ *'..FlterBio(getbio(UserId))..'*'..
'\n𓆩☆𓆪',"md",true) 
end
if text == 'كشف'  and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..rep_idd) or Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,
'\n*• ايديه : '..UserId..
'\n• معرفه : '..UserInfousername..
'\n• رتبته : '..RinkBot..
'\n• رسائله : '..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• تفاعله : '..TotalMsgT..
'*',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local UserId = UserId_Info.id
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId_Info.id) or Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,
'\n*• ايديه : '..UserId..
'\n• معرفه : @'..UserName..
'\n• رتبته : '..RinkBot..
'\n• رسائله : '..TotalMsg..
'\n• تعديلاته : '..TotalEdit..
'\n• تفاعله : '..TotalMsgT..
'*',"md",true) 
end

if text == "تفاعلي" then
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,'\n*• تفاعلك : '..TotalMsgT..'* ',"md",true)  
end
if text == 'فحص البوت' then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,'• البوت عضو في الجروب ',"md",true) 
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
PermissionsUser = '*\n• صلاحيات البوت : مشرف في الجروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• تغيير المعلومات : '..change_info..'\n• تثبيت الرسائل : '..pin_messages..'\n• اضافه مستخدمين : '..invite_users..'\n• مسح الرسائل : '..delete_messages..'\n• حظر المستخدمين : '..restrict_members..'\n• اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end
if text and text:match('^حذف (%d+)$') and tonumber(senderr) == tonumber(5413631898) then
local NumMessage = tonumber(text:match('^حذف (%d+)$'))
local mm = msg.id/2097152/0.5
xxx = 0
for i = 1,NumMessage do
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..mm)
mm = mm - 1
xxx = xxx +1
end
send(msg_chat_id, msg_id, "• تم مسح "..xxx.. ' رسالة', 'md')
end

if text and text:match('^مسح (%d+)$') then
local NumMessage = text:match('^مسح (%d+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return send(msg_chat_id,msg_id,'\n*• العدد اكثر من 1000 لا تستطيع المسح',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = bot.deleteMessages(msg.chat_id,{[1]= Message})
Message = Message - 1048576
end
send(msg_chat_id, msg_id, "• تم مسح "..NumMessage.. ' رسالة', 'md')
end


if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(Fast.."allM"..msg.chat_id, msg.id)
if Redis:get(Fast.."Status:Del:Media"..msg.chat_id) then    
local Numbardel = Redis:get(Fast.."allM:numdel"..msg.chat_id) or 200
local gmedia = Redis:scard(Fast.."allM"..msg.chat_id)  
if tonumber(gmedia) >= tonumber(Numbardel) then
local liste = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "• تم مسح "..k.." من الوسائط تلقائيا\n• يمكنك تعطيل الميزه باستخدام الامر ( `تعطيل المسح التلقائي` )"
bot.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
send(msg_chat_id,msg_id, t)
Redis:del(Fast.."allM"..msg.chat_id)
end
end
end
if text and text:match("^ضع عدد المسح (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع عدد المسح (%d+)$")
Redis:set(Fast.."allM:numdel"..msg.chat_id,Numbardel) 
send(msg_chat_id,msg_id, 'تم تعيين العدد  الى : '..Numbardel)
end
if text == "امسح" or text == "مسح الميديا" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "• تم مسح "..k.." من الوسائط الموجوده"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."allM"..msg.chat_id)
end
end
if #list == 0 then
t = "• لا يوجد ميديا في الجروب"
end
 send(msg_chat_id,msg_id, t)
end
if text == ("الميديا") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local gmria = Redis:scard(Fast.."allM"..msg.chat_id)  
 send(msg_chat_id,msg_id,"• عدد الميديا الموجود هو (* "..gmria.." *)","md")
end


if text == 'المالك' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
if FlterBio(UserInfo.first_name) == "" then
send(msg_chat_id,msg_id,"*• اوبس , المالك حسابه محذوف *","md",true)  
return false
end 
local photo = bot.getUserProfilePhotos(UserInfo.id)
local InfoUser = bot.getUserFullInfo(UserInfo.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
if photo.total_count > 0 then
local TestText = "- معلومات المالك : \n\n- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n \n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown')  
else
local TestText = "- معلومات المالك : \n\n- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n \n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end

end
end
end


if text == 'كشف البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n*• قائمه البوتات \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if Info_Members.members[k].status.Fastbots == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '→ *{ ادمن }*'
else
Admin = ""
end
listBots = listBots.."*"..k.." - @"..UserInfo.username.."* "..Admin.."\n"
end
send(msg_chat_id,msg_id,listBots.."*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n• عدد البوتات التي هي ادمن ( "..x.." )*","md",true)  
end


 
if text == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
restricted = '\n*• قائمه المقيديين \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.Fastbots == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." - @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
send(msg_chat_id,msg_id,restricted,"md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد مقيدين ',"md",true)  
end
end

local Bot_Name = (Redis:get(Fast.."Name:Bot") or "تون")
if text then
if text == "غادر" or text:match(Bot_Name.." غادر$") then  
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,"*\n• تم مغادرة الجروب بامر من المطور *","md",true)  
local Left_Bot = bot.leaveChat(msg.chat_id)
end
end
if text == 'تاك' and (Redis:get(Fast..'tagallgroup'..msg.chat_id) == "open") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*• قائمه الاعضاء \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
send(msg_chat_id,msg_id,listall,"md",true)  
end

if text == "قفل ارسال القناة" or text == "قفل القناة" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:SenderChat"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل ارسال القناة").Lock,"md",true)  
return false
end 
if text == "فتح ارسال القناة" or text == "فتح القناة" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:SenderChat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح ارسال القناة").unLock,"md",true)  
return false
end 
if text == "قفل الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:phshar"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفشار").Lock,"md",true)  
return false
end 
if text == "فتح الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:phshar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الفشار").unLock,"md",true)  
return false
end 
if text == "قفل الكفر" or text == "قفل السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:alkfr"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكفر").Lock,"md",true)  
return false
end 
if text == "فتح الكفر" or text == "فتح السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:alkfr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الكفر").unLock,"md",true)  
return false
end 
if text == "قفل الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:english"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانكليزيه").Lock,"md",true)  
return false
end 
if text == "فتح الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:english"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الانكليزيه").unLock,"md",true)  
return false
end 

if text == 'احمدو' or text == 'تون' or text == 'احمد'  then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Dev', url = 't.me/F_T_Y'}, 
},
}
}
return send(msg_chat_id,msg_id,"[rino](tg://user?id=5413631898)","md",true, false, false, true, reply_markup)
end
if text == 'مصنع السورس' or text == 'المصنع' or text == 'مصنع'  then
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
  {
  {text = 'Source', url = 'https://t.me/zqqqzq'}, 
  },
  }
  }
  return send(msg_chat_id,msg_id,"[Source](https://t.me/zqqqzq)","md",true, false, false, true, reply_markup)
  end
if text == "صورتي" then
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*• الصورة معطله*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=senderr.."/sorty2"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape("٭ عدد صورك هو "..photo.total_count.." صورة").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return send(msg_chat_id,msg_id,'*• لا توجد صورة ف حسابك*',"md",true) 
end
end
end

if text == "قفل التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:tphlesh"..msg_chat_id,true) 
Redis:del(Fast.."Status:IdPhoto"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التفليش").Lock,"md",true)  
return false
end 
if text == "فتح التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tphlesh"..msg_chat_id)  
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التفليش").unLock,"md",true)  
return false
end 
if text == "قفل الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:farsia"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفارسيه").Lock,"md",true)  
return false
end 
if text == "فتح الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:farsia"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الفارسيه").unLock,"md",true)  
return false
end 

if text == "قفل الدردشة" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:text"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الدردشة").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:AddMempar"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Join"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservr"..msg_chat_id,true)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."lockpin"..msg_chat_id,(bot.getChatPinnedMessage(msg_chat_id).id or true)) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..msg_chat_id,"del")    
end
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل جميع الاوامر").Lock,"md",true)  
return false
end 
if text == 'جلب نسخه المطورين' then
  if not msg.Asasy then 
  return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
  end
local Dev = Redis:smembers(Fast.."Dev:Groups")
local DevS = Redis:smembers(Fast.."Devss:Groups")
local rino2 = Redis:smembers(Fast.."ControlAll:Groups")
local set_Json = '{"BotId": '..Fast..',\n"Dev":['
for k,v in pairs(Dev) do
set_Json = set_Json..tonumber(v)..","
end
local set3_Json = set_Json..'],\n"rino2":['
for k,v in pairs(rino2) do
set_Json = set3_Json..tonumber(v)..","
end
local set2_Json = set_Json..'],\n"DevS":['
for k,v in pairs(DevS) do
set2_Json = set2_Json..tonumber(v)..","
end
local File = io.open('./BotDev.json', "w")
File:write(set2_Json..']\n}')
File:close()
bot.sendDocument(msg_chat_id,msg_id,'./BotDev.json', '', 'md')
end


if text == 'رفع نسخه المطورين' and msg.reply_to_message_id ~= 0 then
  if not msg.Asasy then 
  return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
  end
  local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
  if Message_Reply.content.document then
  local File_Id = Message_Reply.content.document.document.remote.id
  local Name_File = Message_Reply.content.document.file_name
  local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
  local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
  local Get_Info = io.open(download_,"r"):read('*a')
  local Gjson = JSON.decode(Get_Info)
  local Dev = Gjson.Dev
  local DevS = Gjson.DevS
  local rino2 = Gjson.rino2
  for k,v in pairs(Dev) do 
  if not Redis:sismember(Fast.."Dev:Groups",v) then
  Redis:sadd(Fast.."Dev:Groups",v)
  end
  end
  for k,v in pairs(rino2) do 
    if not Redis:sismember(Fast.."ControlAll:Groups",v) then
    Redis:sadd(Fast.."ControlAll:Groups",v)
    end
    end
  for k,v in pairs(DevS) do 
  if not Redis:sismember(Fast.."Devss:Groups",v) then
  Redis:sadd(Fast.."Devss:Groups",v)
  end
  end
  return send(msg_chat_id,msg_id,'\n*• تم استرجاع قائمه المطورين* ',"md",true) 
  end
  end  
if text == "انشاء رابط خاص" then
  if not msg.Admin then
  return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
  end
  local Get_Chat = bot.getChat(msg_chat_id)
  local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'rino',tonumber(msg.date+864000),nil,true)
  if LinkGroup.code == 3 then
  return send(msg_chat_id,msg_id,"⌯ لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
  end
  local reply_markup = bot.replyMarkup{type = 'inline',data = {
  {{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
  return send(msg_chat_id, msg_id, "⌯ Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
  end

if text == "قفل وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:AlUasat"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل جميع الوسائط المميزين").Lock,"md",true)  
return false
end 
if text == "فتح وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AlUasat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح جميع الوسائط المميزين").unLock,"md",true)  
return false
end 

if text == "قفل الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل جميع الوسائط").Lock,"md",true)  
return false
end 
if text == "فتح الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح جميع الوسائط").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AddMempar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح الدردشة" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:text"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الدردشة").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Join"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:del(Fast.."Lock:tagservr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."lockpin"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" or text == "فتح تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..msg_chat_id)    
end
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فـتح جميع الاوامر").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hdel(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Link"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:User:Name"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:hashtak"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Cmd"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركة" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركة").Lock,"md",true)  
return false
end 
if text == "قفل المتحركة بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركة").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركة بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركة").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركة بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المتحركة").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركة" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح المتحركة").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:geam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Keyboard"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:forward"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Document"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Unsupported"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Markdaun"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Contact"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل المنشورات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المنشورات").Lock,"md",true)  
return false
end 
if text == "قفل المنشورات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المنشورات").lockKid,"md",true)  
return false
end 
if text == "قفل المنشورات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المنشورات").lockKtm,"md",true)  
return false
end 
if text == "قفل المنشورات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل المنشورات").lockKick,"md",true)  
return false
end 
if text == "فتح المنشورات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Spam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح المنشورات").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Inlen"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"• تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Link"..msg_chat_id..""..senderr,120,true) 
return send(msg_chat_id,msg_id,"• ارسل رابط الجروب او رابط قناة الجروب","md",true)  
end
if text == "مسح الرابط" or text == "مسح الرابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Link"..msg_chat_id) 
return send(msg_chat_id,msg_id,"• تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(Fast.."Status:Link"..msg_chat_id) then
return send(msg_chat_id,msg_id,"• تم تعطيل الرابط من قبل الادارة","md",true)
end 
local Get_Chat = bot.getChat(msg_chat_id)
local GetLink = Redis:get(Fast.."Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return send(msg_chat_id, msg_id, "• Link Group : \n["..GetLink.."]", 'md', true, false, false, false, reply_markup)
else
return send(msg_chat_id, msg_id, "• لا يوجد رابط ارسل انشاء رابط", 'md', true, false, false, false, reply_markup)
end
end
if text == "انشاء رابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'abbas',tonumber(msg.date+864000),100,false)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"• لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup.invite_link) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return send(msg_chat_id, msg_id, "• Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
end

if text == "ضع الترحيب عام" or text == "وضع الترحيب عام" then  
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
• ارسل لي الترحيب عام الان
• تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص : `{الاسم}`
- عرض يوزر الشخص : `{المعرف}`
- عرض اسم الجروب : `{الجروب}`
- عرض عدد الاعضاء : `{الاعضاء}`
- عرض عدد الادمنيه : `{الادمنيه}`
- عرض الوقت : `{الوقت}`
- عرض التاريخ : `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Welcome = Redis:get(Fast.."Welcome:Groups")
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"• لم يتم تعيين ترحيب عام","md",true)   
end 
end
if text == "مسح الترحيب عام" or text == "مسح الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Groups") 
return send(msg_chat_id,msg_id,"• تم ازالة الترحيب العام في المجموعات","md",true)   
end

if Redis:get(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr) then 
if text == "الغاء" then 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
return send(msg_chat_id,msg_id,"• تم الغاء حفظ الترحيب عام","md",true)   
end 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
Redis:set(Fast.."Welcome:Groups",text) 
return send(msg_chat_id,msg_id,"• تم حفظ الترحيب العام للمجموعات","md",true)     
end



if text == "ضع الترحيب" or text == "وضع الترحيب" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
• ارسل لي الترحيب عام الان
• تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص : `{الاسم}`
- عرض يوزر الشخص : `{المعرف}`
- عرض اسم الجروب : `{الجروب}`
- عرض عدد الاعضاء : `{الاعضاء}`
- عرض عدد الادمنيه : `{الادمنيه}`
- عرض الوقت : `{الوقت}`
- عرض التاريخ : `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
return send(msg_chat_id,msg_id,"• تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"• لم يتم تعيين ترحيب للجروب","md",true)   
end 
end
if text == "مسح الترحيب" or text == "مسح الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"• تم ازالة ترحيب الجروب","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"• ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "مسح القوانين" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Rules"..msg_chat_id) 
return send(msg_chat_id,msg_id,"• تم ازالة قوانين الجروب","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(Fast.."Group:Rules" .. msg_chat_id)   
if Rules then     
return send(msg_chat_id,msg_id,Rules,"md",true)     
else      
return send(msg_chat_id,msg_id,"• لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:setex(Fast.."Set:Description:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"• ارسل لي وصف الجروب الان","md",true)  
end
if text == "مسح الوصف" or text == "مسح الوصف" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatDescription(msg_chat_id, '') 
return send(msg_chat_id,msg_id,"• تم ازالة قوانين الجروب","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatTitle(msg_chat_id,NameChat)
return send(msg_chat_id,msg_id,"• تم تغيير اسم الجروب الى : "..NameChat,"md",true)    
end

if text == ("ضع صورة") or text == ("وضع صورة") then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:set(Fast.."Chat:Photo"..msg_chat_id..":"..senderr,true) 
return send(msg_chat_id,msg_id,"• ارسل الصورة لوضعها للجروب","md",true)    
end

if text == "مسح قائمه المنع" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*• لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(Fast.."Filter:Group:"..v..msg_chat_id)  
Redis:srem(Fast.."List:Filter"..msg_chat_id,v)  
end  
return send(msg_chat_id,msg_id,"*• تم مسح ("..#list..") كلمات ممنوعه *","md",true)   
end
if text == "قائمه المنع" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*• لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
Filter = '\n*• قائمه المنع \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k,v in pairs(list) do  

if v:match('photo:(.*)') then
ver = 'صورة'
elseif v:match('animation:(.*)') then
ver = 'متحركة'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(Fast.."Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.."- "..ver.." » { "..Text_Filter.." }*\n"    
end  
send(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..senderr,'true')
return send(msg_chat_id,msg_id,'\n*• ارسل الان { ملصق ,متحركة ,صورة ,رسالة } *',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..senderr,'DelFilter')
return send(msg_chat_id,msg_id,'\n*• ارسل الان { ملصق ,متحركة ,صورة ,رسالة } *',"md",true)  
end

if text == "اضف امر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• الان ارسل لي الامر القديم ...", 'md', false, false, false, false, reply_markup)
end
if text == "مسح امر" or text == "مسح امر" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الامر الذي قمت بوضعه مكان الامر القديم", 'md', false, false, false, false, reply_markup)
end
if text == "مسح الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(Fast.."Command:List:Group"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"• تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id.."")
Command = "• قائمه الاوامر المضافه  \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ← {"..Commands.."}\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "• لا توجد اوامر مضافه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n• تم تثبيت الرسالة","md",true)
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = bot.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n• تم الغاء تثبيت الرسالة","md",true)
bot.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n• تم الغاء تثبيت جميع الرسائل","md",true)
for i=0, 20 do
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if not bot.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = senderr..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = senderr..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = senderr..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = senderr..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = senderr..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = senderr..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصورة', data = senderr..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصورة', data = senderr..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = senderr..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = senderr..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامة', data = senderr..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامة', data = senderr..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = senderr..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = senderr..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = senderr..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = senderr..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = senderr..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = senderr..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = senderr..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = senderr..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = senderr..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = senderr..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = senderr..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = senderr..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = senderr..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = senderr..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = senderr..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = senderr..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = senderr..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = senderr..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = senderr..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = senderr..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامة', data = senderr..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامة', data = senderr..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = senderr..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = senderr..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = senderr..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = senderr..'/'.. 'mute_namemy'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, '• اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Link"..msg.chat_id) then
Statuslink = '❬ ✔️ ❭' else Statuslink = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Welcome"..msg.chat_id) then
StatusWelcome = '❬ ✔️ ❭' else StatusWelcome = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Id"..msg.chat_id) then
StatusId = '❬ ✔️ ❭' else StatusId = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '❬ ✔️ ❭' else StatusIdPhoto = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Reply"..msg.chat_id) then
StatusReply = '❬ ✔️ ❭' else StatusReply = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '❬ ✔️ ❭' else StatusReplySudo = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:BanId"..msg.chat_id)  then
StatusBanId = '❬ ✔️ ❭' else StatusBanId = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:SetId"..msg.chat_id) then
StatusSetId = '❬ ✔️ ❭' else StatusSetId = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
StatusGames = '❬ ✔️ ❭' else StatusGames = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:KickMe"..msg.chat_id) then
Statuskickme = '❬ ✔️ ❭' else Statuskickme = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:AddMe"..msg.chat_id) then
StatusAddme = '❬ ✔️ ❭' else StatusAddme = '❬ ❌ ❭'
end
local protectionGroup = '\n*• اعدادات حمايه الجروب\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
..'\n• جلب الرابط ➤ '..Statuslink
..'\n• جلب الترحيب ➤ '..StatusWelcome
..'\n• الايدي ➤ '..StatusId
..'\n• الايدي بالصورة ➤ '..StatusIdPhoto
..'\n• الردود ➤ '..StatusReply
..'\n• الردود العامة ➤ '..StatusReplySudo
..'\n• الرفع ➤ '..StatusSetId
..'\n• الحظر - الطرد ➤ '..StatusBanId
..'\n• الالعاب ➤ '..StatusGames
..'\n• امر اطردني ➤ '..Statuskickme..'*\n\n.'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناة السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n• اعدادات الجروب ".."\n• علامة ال (✔️) تعني مقفول".."\n• علامة ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =senderr..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'المنشورات : ', data =senderr..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =senderr..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =senderr..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركة : ', data =senderr..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =senderr..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشة : ', data =senderr..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =senderr..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =senderr..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =senderr..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =senderr..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =senderr..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(msg_chat_id).farsia, data = '&'},{text = 'الفارسيه : ', data =senderr..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(msg_chat_id).tphlesh, data = '&'},{text = 'التفليش : ', data =senderr..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(msg_chat_id).alkfr, data = '&'},{text = 'الكفر : ', data =senderr..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(msg_chat_id).alphsar, data = '&'},{text = 'الفشار : ', data =senderr..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي ... ', data =senderr..'/'.. 'NextSeting'}
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'الجروب' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local permissions = '*\n• صلاحيات الجروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..'\n• ارسال الويب : '..web..'\n• تغيير معلومات الجروب : '..info..'\n• اضافه مستخدمين : '..invite..'\n• تثبيت الرسائل : '..pin..'\n• ارسال الميديا : '..media..'\n• ارسال الرسائل : '..messges..'\n• اضافه البوتات : '..other..'\n• ارسال استفتاء : '..polls..'*\n\n'
local TextChat = '*\n• معلومات الجروب :\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..' \n• اسم الجروب : ❬* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ❭\n• عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n• عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n• عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n• عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n• الايدي : ❬ *`'..msg.chat_id..'`* ❭*\n'
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,TextChat..permissions, "md")
else
return send(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
end


if text == 'صلاحيات الجروب' then 
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = senderr..'/web'}, 
},
{
{text = '- تغيير معلومات الجروب : '..info, data =senderr..  '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data =senderr..  '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data =senderr..  '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data =senderr..  '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data =senderr..  '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data =senderr..  '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data =senderr.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, "• الصلاحيات - ", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",rep_idd) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",rep_idd) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, rep_idd) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, rep_idd) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, rep_idd) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, rep_idd) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(rep_idd) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",rep_idd)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",rep_idd)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, rep_idd) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, rep_idd) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, rep_idd) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, rep_idd) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) == false then
return send(msg_chat_id,msg_id,"\n*• ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",rep_idd)
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
end
return send(msg_chat_id,msg_id,"\n*• تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return send(msg_chat_id,msg_id,"\n*• ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",UserId_Info.id)
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n*• لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
end
return send(msg_chat_id,msg_id,"\n*• تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end
if text == "تنزيل جميع الرتب" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Ownerss then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(8)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id)
Redis:del(Fast.."Creator:Group"..msg_chat_id)
Redis:del(Fast.."Manger:Group"..msg_chat_id)
Redis:del(Fast.."Admin:Group"..msg_chat_id)
--Redis:del(Fast.."Special:Group"..msg_chat_id)
return send(msg_chat_id,msg_id,'\n*• تم تنزيل جميع رتب الجروب { المنشئين الاساسسين , المنشئين , المدراء , الادمنيه  }* ',"md",true)  
end

if text and text:match('ضع لقب (.*)') and msg.reply_to_message_id ~= 0 then
local CustomTitle = text:match('ضع لقب (.*)')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..rep_idd.."&custom_title="..CustomTitle)
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"• تم وضع له لقب : "..CustomTitle).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"\n• عذرآ هناك خطا تاكد من البوت ومن الشخص","md",true)  
end 
end
if text and text:match('^ضع لقب @(%S+) (.*)$') then
local UserName = {text:match('^ضع لقب @(%S+) (.*)$')}
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName[1])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName[1]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..UserId_Info.id.."&custom_title="..UserName[2])
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم وضع له لقب : "..UserName[2]).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"\n• عذرآ هناك خطا تاكد من البوت ومن الشخص","md",true)  
end 
end 
if text and text:match("^ضع التكرار (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع التكرار (%d+)$")
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Num:Spam",Numbardel)  
send(msg_chat_id,msg_id, 'تم تعيين عدد التكرار الى  : '..Numbardel)
end
if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..rep_idd.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = senderr..'/groupNumseteng//'..rep_idd}, 
},
}
}
return send(msg_chat_id, msg_id, "• صلاحيات المستخدم - ", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..UserId_Info.id.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = senderr..'/groupNumseteng//'..UserId_Info.id}, 
},
}
}
return send(msg_chat_id, msg_id, "• صلاحيات المستخدم - ", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"\n*• لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"\n*• لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*• لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"• تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,'• تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح تعديلاتي' or text == 'مسح تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..senderr)
send(msg_chat_id,msg_id,'• تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Add:Memp'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,'• تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'• عدد رسائلك هنا *~ '..(Redis:get(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) or 1)..'*',"md",true)  
elseif text == 'تعديلاتي' or text == 'تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'• عدد التعديلات هنا *~ '..(Redis:get(Fast..'Num:Message:Edit'..msg.chat_id..senderr) or 0)..'*',"md",true)  
elseif text == 'جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'• عدد جهاتك المضافه هنا *~ '..(Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0)..'*',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Admin then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
bot.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
end

if text == 'تفاعل الجروب' and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message = msg.id/2097152/0.5
local MsgText = ''  

if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'ملك التلكرام 💖'  
end 

return send(msg_chat_id,msg_id,"• تفاعل الجروب : "..MsgText, "md")
end
if text == 'تعيين الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Group"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[
• ارسل الان النص
• يمكنك اضافه :
• `#username` » اسم المستخدم
• `#msgs` » عدد الرسائل
• `#photos` » عدد الصور
• `#id` » ايدي المستخدم
• `#auto` » نسبة التفاعل
• `#stast` » رتبة المستخدم 
• `#edit` » عدد التعديلات
• `#game` » عدد النقاط
• `#AddMem` » عدد الجهات
• `#Description` » تعليق الصورة
• `#Bio` » البايو.
]],"md",true)    
end 
if text == 'مسح الايدي' or text == 'مسح الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Group"..msg.chat_id)
return send(msg_chat_id,msg_id, '• تم ازالة رسالة الايدي ',"md",true)  
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local List = { 
[[
↫ #Description
 ℘︙معرفك ~⪼ #username
 ℘︙ايديك ~⪼ #id
 ℘︙رتبتك ~⪼ #stast  
 ℘︙تفاعلك ~⪼ #auto
 ℘︙رسائلك ~⪼ #msgs
 ℘︙تعديلاتك ~⪼ #edit
 ℘︙نقاطك ~⪼ #game
 ℘︙البايو ~⪼ #Bio
]],[[
↫ #Description
⌁︙ايديك↫ #id
⌁︙معرفك↫ #username
⌁︙رتبتك↫ #stast
⌁︙تفاعلك↫ #auto
⌁︙رسائلك↫ #msgs 
⌁︙تعديلاتك↫ #edit
⌁︙نقاطك↫ #game
]],
[[
↫ #Description
⌁︙ايديك↫ #id
⌁︙معرفك↫ #username
⌁︙رتبتك↫ #stast
⌁︙تفاعلك↫ #auto
⌁︙رسائلك↫ #msgs 
⌁︙تعديلاتك↫ #edit
⌁︙نقاطك↫ #game
⌁︙البايو↫ #Bio
]],
[[
• #Description
• ايديـك ❪ #id ❫
• معرفـك ❪ #username ❫
• رتبتـك ❪ #stast ❫
• تفاعلك ❪ #auto  ❫
• رسائلك ❪ #msgs ❫
• تعديلاتـك ❪ #edit ❫
• نقاطك ❪ #game ❫
]],
[[ 
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 . 
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 . 
゠𝙼𝚂𝙶 𖨈 #stast 𖥲 . 
゠𝙸𝙳 𖨈 #id 𖥲 . 
]], 
[[• ᴜѕᴇʀɴᴀᴍᴇ ➥• #username . 
• ᴍѕɢѕ ➥• #msgs . 
• ѕᴛᴀᴛѕ ➥• #stast . 
• ʏᴏᴜʀ ɪᴅ ➥• #id  . 
• ᴇᴅɪᴛ ᴍsɢ ➥• #edit . 
• ᴅᴇᴛᴀɪʟs ➥• #auto .  
• ɢᴀᴍᴇ ➥• #game .]], 
[[ 
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕 
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕 
➭- ??𝒔𝒈𝒆𓂅 #msgs 𓍯. ?? 
➭- ??𝒅 𓂅 #id 𓍯. 💕 
]], 
[[ 
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 •
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚ 
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂ 
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕ 
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊 
]], 
[[ 
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 . 
├ 𝐌??𝐆 𖤱 #msgs 𖦴 . 
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 . 
└ 𝐈𝐃 𖤱 #id 𖦴 . 
]], 
[[ 
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 :#username  
𓄼??🇶 𝑺𝒕𝒂𝒔𝒕 :#stast  
𓄼🇮🇶 𝒊𝒅 :#id  
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 :#game  
𓄼🇮🇶 𝑴𝒔𝒈𝒔 :#msgs 
]], 
[[ 
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞. 
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞. 
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞. 
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞. 
]], 
[[ 
☆• 𝐮𝐬𝐞𝐫 : #username 𖣬   
☆• 𝐦𝐬𝐠  : #msgs 𖣬  
☆• 𝐬𝐭𝐚 : #stast 𖣬  
☆• 𝐢𝐝  : #id 𖣬 
]], 
[[ 
- 𓏬 𝐔??𝐄𝐫 : #username 𓂅 . 
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 . 
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 . 
- 𓏬 𝐈𝐃 : #id 𓂅 . 
]], 
[[ 
.𖣂 𝙪??????𝙣𝙖𝙢𝙚 , #username   
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast   
.𖣂 𝙡𝘿 , #id   
.𖣂 𝙂𝙖𝙢𝙨 , #game  
.𖣂 𝙢𝙨𝙂𝙨 , #msgs 
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,Text_Rand)
return send(msg_chat_id,msg_id, '• تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end
if text == 'مسح الايدي عام' or text == 'مسح الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Groups")
return send(msg_chat_id,msg_id, '• تم ازالة رسالة الايدي ',"md",true)  
end
if text == 'تعيين الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Groups"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[
• ارسل الان النص
• يمكنك اضافه :
• `#username` » اسم المستخدم
• `#msgs` » عدد الرسائل
• `#photos` » عدد الصور
• `#id` » ايدي المستخدم
• `#auto` » نسبة التفاعل
• `#stast` » رتبة المستخدم 
• `#edit` » عدد التعديلات
• `#game` » عدد النقاط
• `#AddMem` » عدد الجهات
• `#Description` » تعليق الصورة
• `#Bio` » البايو.
]],"md",true)    
end 





if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين ثانوين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين الثانويين*","md",true)
end
if TextMsg == 'المطورين' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if TextMsg == 'المالكين' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(3)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Memberss = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Memberss == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد المالكين حاليا , ","md",true)  
end
Redis:del(Fast.."Ownerss:Group"..msg_chat_id) 
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
end
end
end
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Memberss.."} من مالكين *","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(8)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المنشؤين الاساسيين *","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد منشئين حاليا , ","md",true)  
end
Redis:del(Fast.."Creator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المنشئين *","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(Fast.."Manger:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المدراء *","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد ادمنيه حاليا , ","md",true)  
end
Redis:del(Fast.."Admin:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من الادمنيه *","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(Fast.."Special:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المميزين *","md",true)
end
if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين حاليا , ","md",true)  
end
Redis:del(Fast.."BanGroup:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المحظورين *","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مكتومين حاليا , ","md",true)  
end
Redis:del(Fast.."SilentGroup:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المكتومين *","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.Fastbots == "chatMemberStatusRestricted" then
bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"*• تم مسح {"..x.."} من المقيديين *","md",true)
else
send(msg_chat_id,msg_id,'• لا يوجد مقيدين ',"md",true)  
end
end
if TextMsg == 'البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.Fastbots == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n*• عدد البوتات الموجوده : "..#List_Members.."\n• تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local y = false
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.Fastbots == "ok" then
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*• عدد المطرودين في الموجوده : "..#List_Members.."\n• تم الغاء الحظر عن ( "..x.." ) من الاشخاص*","md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد مطرودين ',"md",true)  
end
end
if TextMsg == 'المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.Fastbots == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.Fastbots == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*• تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد محذوفين ',"md",true)  
end
end
end
if text == 'طرد المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.Fastbots == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.Fastbots == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*• تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,'• لا يوجد محذوفين ',"md",true)  
end
end
if text == 'طرد البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*• البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.Fastbots == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n*• عدد البوتات الموجوده : "..#List_Members.."\n• تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if text == ("مسح الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(Fast.."List:Manager"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"• تم مسح قائمه الردود","md",true)  
end
if text == ("الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
text = "• قائمه الردود \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركة 🎭"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رسالة ✉"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صورة 🎇"
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو ??"
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود مضافه في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان اسم الرد لاضافته في الردود ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,"true2")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان اسم الرد لمسحه من الردود", 'md', false, false, false, false, reply_markup)
end
if text == ("مسح الردود العامة") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"• تم مسح الردود العامة","md",true)  
end
if text == ("الردود العامة") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامة \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركة 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رسالة ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صورة 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان اسم الرد لاضافته في الردود العامة ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لمسحها من الردود العامة", 'md', false, false, false, false, reply_markup)
end
if text=="اذاعة خاص" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعة" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعة بالتثبيت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعة بالتوجيه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعة خاص بالتوجيه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*• معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*• معلومات الكشف \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"..'\n• الحظر العام : '..BanAll..'\n• الحظر : '..BanGroup..'\n• الكتم : '..SilentGroup..'\n• التقييد : '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",rep_idd) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*• تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*• عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n• عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n• عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*• تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end

if text == 'ضع رسالة المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'• ارسل لي الرسالة الان')
end
if text == 'مسح رسالة المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'• تم مسح رسالة المطور')
end
---استبدال كلمه--
if text == "استبدال كلمه" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast..msg.chat_id..senderr.."replace",true)
return bot.sendText(msg_chat_id,msg_id,'\n• ارسل الكلمه القديمه ليتم استبدالها',"md",true)  
end
if text == "مسح الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
for k,v in pairs(list) do
Redis:del(Fast.."Word:Replace"..v)
end
Redis:del(Fast.."Words:r")
send(msg_chat_id,msg_id,"• تم مسح الكلمات المستبدله")
end
if text == "الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد كلمات مستبدله")
end
local txx = " قائمه الكلمات المستبدله \n"
for k,v in pairs(list) do 
cmdd = Redis:get(Fast.."Word:Replace"..v)
txx = txx..k.." - "..v.." »» "..cmdd.."\n"
end
bot.sendText(msg_chat_id,msg_id,txx)
end
----
-- like id 
if text == "تفعيل لايك ايدي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*•  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
if not Redis:get(Fast.."like:id:"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n*•  اللايك ايدي مفعل مسبقا*',"md",true) 
end
Redis:del(Fast.."like:id:"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n*•  تم تفعيل اللايك ايدي*\n•  و رمز اللايك ( '..emo..' )\n•  لتغيره ( ` تعيين لايك ايدي + الايموجي` )',"md",true) 
end

if text == "تعطيل لايك ايدي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*•  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
if Redis:get(Fast.."like:id:"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n*•  اللايك ايدي معطل مسبقا*',"md",true) 
end
Redis:set(Fast.."like:id:"..msg.chat_id, true)
return send(msg_chat_id,msg_id,'\n*•  تم تعطيل اللايك ايدي*',"md",true) 
end

if text and text:match('^تعيين لايك ايدي (.*)') then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*•  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo = text:match('^تعيين لايك ايدي (.*)')
Redis:set(Fast.."like:id:emo:"..msg.chat_id, emo)
return send(msg_chat_id,msg_id,'\n*•  تم وضع اللايك ايدي* ( '..emo..' )',"md",true) 
end

if text == "تصفير لايك ايدي" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n• هذا الامر يخص ⦃*'..Controller_Num(1)..'*⦄ بس',"md",true)  
end
local id_users = Redis:smembers(Fast.."like:user:")
if #id_users <= 0 then
return send(msg_chat_id,msg_id,'\n•  لا يوجد مستخدمين',"md",true) 
end
for k,v in pairs(id_users) do
Redis:del(Fast.."like:users:"..v)
end
Redis:del(Fast.."like:user:")
return send(msg_chat_id,msg_id,'\n•  تم حذف ⦃ `'..#id_users..'` ⦄ مستخدم',"md",true) 
end

if text == "توب لايك ايدي" then 
local id_users = Redis:smembers(Fast.."like:user:")
local list = {}
local msg_text = "•  اعلى 20 مستخدم حصلو على لايك :\n\n"
if #id_users <= 0 then
return send(msg_chat_id,msg_id,'\n•  لا يوجد مستخدمين',"md",true) 
end
for k,v in pairs(id_users) do
local likes = #Redis:smembers(Fast.."like:users:"..v)
if tonumber(likes) ~= 0 then
table.insert(list, {tonumber(likes) , v})
end
end
table.sort(list, function(a, b) return a[1] > b[1] end)
local emoji = { "🥇" ,"🥈","🥉","4)","5)","6)","7)","8)","9)","10)","11)","12)","13)","14)","15)","16)","17)","18)","20)"}
for k,v in pairs(list) do
if tonumber(k) <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
msg_text = msg_text..emoji[tonumber(k)]..' '..user_name..' l '..v[1]..'\n'
end
end
return send(msg_chat_id,msg_id,msg_text,"html",true)  
end

-- my rd
if text and Redis:get(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id) then
if Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) then
return send(msg.chat_id, msg.id, "يوجد رد بهذا الاسم مسبقا", 'md')
end
Redis:sadd(Fast..":My_Rd:text:"..msg.chat_id, text)
Redis:set(Fast..":My_Rd:"..text..":"..msg.chat_id, msg.sender_id.user_id)
Redis:incrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
Redis:del(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id, "تم اضافه رد اليك بنجاح", 'md')
end

if text == "اضف ردي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local Num = Redis:get(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id)
if tonumber(Num) == 2 then 
return send(msg.chat_id, msg.id, "لديك ردين باسمك فعلا ولايمكن الزياده.", 'md')
end
Redis:set(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id, true)
send(msg.chat_id, msg.id, "ارسل اسم الرد الان :", 'md')
end

if text and Redis:get(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id) then
if not Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) then
return send(msg.chat_id, msg.id, "لايوجد ردود بهذا الاسم", 'md')
end
if not tonumber(Redis:get(Fast..":My_Rd:"..text..":"..msg.chat_id)) == tonumber(msg.sender_id.user_id) and not msg.Owners then
return send(msg.chat_id, msg.id, "هذا الرد لايخصك", 'md')
end
Redis:del(Fast..":My_Rd:"..text..":"..msg.chat_id)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, text)
Redis:decrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
Redis:del(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg.chat_id, msg.id, "تم حذف ردك بنجاح", 'md')
end

if text == "حذف ردودي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
for k,v in pairs(list) do
if tonumber(Redis:get(Fast..":My_Rd:"..v)) == tonumber(msg.sender_id.user_id)then
Redis:del(Fast..":My_Rd:"..v..":"..msg.chat_id)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, v)
Redis:decrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
end
end
return send(msg.chat_id, msg.id, "مسحت الردود", 'md')
end

if text == "حذف قائمه الردود" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
for k,v in pairs(list) do
Redis:del(Fast..":My_Rd:"..v)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, v)
local id = Redis:get(Fast..":My_Rd:"..v..":"..msg.chat_id)
Redis:decrby(Fast..":My_Rd:num"..id..":"..msg.chat_id, 1)
end
return send(msg.chat_id, msg.id, "مسحت الردود", 'md')
end

if text == "حذف ردي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local Num = Redis:get(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id)
if not Num then 
return send(msg.chat_id, msg.id, "انت لا تمتلك ردود", 'md')
end
Redis:set(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id, true)
send(msg.chat_id, msg.id, "ارسل اسم الرد الان :", 'md')
end

if text and  Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then 
local ID = Redis:get(Fast..":My_Rd:"..text..":"..msg.chat_id)
local UserInfo = bot.getUser(ID)
local photo = bot.getUserProfilePhotos(ID)
local Bio = FlterBio(getbio(ID))
local msg_text = "NAME : "..UserInfo.first_name.."\nBIO : "..Bio
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = UserInfo.first_name , url = "t.me/"..(UserInfo.username or UserBot)},
},
}
}
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,msg_text,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return send(msg_chat_id,msg_id,msg_text,"md",true) 
end
end
------ Enable & Disable
if text == "تفعيل ردي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
Redis:del(Fast..":My_Rd:lock:"..msg.chat_id)
send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↞ابشر فعلت امر ردي").Lock,"md",true)  
end
if text == "تعطيل ردي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
Redis:set(Fast..":My_Rd:lock:"..msg.chat_id, true)
send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↞ابشر عطلت امر ردي").Lock,"md",true)  
end

--- سي في 
if text == "مسح رسالة سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Fast..":CV:Text:"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n⌯ تم مسح رسالة السي في',"md",true)  
end

if text == "مسح سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n⌯ لا يوجد سي في باسمك',"md",true)  
end
Redis:del(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n⌯ تم مسح السي في',"md",true)  
end

if text == "اضف احمدي" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n⌯ انت تمتلك سي في باسمك اكتب ( `عرض سي في` ) لتتمكن من رؤيه السي في',"md",true)  
end
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Name")
return send(msg_chat_id,msg_id,'\n⌯ مرحبا بك في السجل المدني الخاص بسورس تون\nاكتب اسمك الان :',"md",true)  
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Name" then 
local name = FlterBio(text)
Redis:set(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id, name)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Age")
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ اسمك بنجاح\nاكتب عمرك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Age" then 
if not text:match('(%d+)') then 
return send(msg_chat_id,msg_id,'\n⌯ ادخل عمرك بالارقام لو سمحت',"md",true)
end
Redis:set(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id, text)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Address")
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ عمرك بنجاح\nاكتب عنوانك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Address" then 
local address = FlterBio(text)
Redis:set(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id, address)
Redis:del(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ السي في بنجاح\nاكتب عرض سي في لرؤيه ملفك الشخصي',"md",true)
end

if msg.reply_to_message_id ~= 0 and text then
if (text:match('(.*)سي في(.*)') or text:match('(.*)احمدي(.*)') or text == "سي في") then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id) then
local name = Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "⌯ الاسم : #Name \n⌯ العمر : #Age \n⌯ الاقامه : #Address"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end
end
end

if text == "عرض سي في" then 
if msg.reply_to_message_id ~= 0 then -- if rep
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if not Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n⌯ لا يمتلك سي في',"md",true)
end
local name = Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "⌯ الاسم : #Name \n⌯ العمر : #Age \n⌯ الاقامه : #Address"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end --  end if rep
if not Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then -- if not rep
return send(msg_chat_id,msg_id,'\n⌯ انت لا تمتلك سي في باسمك اكتب ( `اضف سي في` ) لتتمكن من اضافه السي في',"md",true)  
end -- end if not rep
local name = Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "⌯ الاسم : #Name \n⌯ العمر : #Age \n⌯ الاقامه : #Address"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end

if text == "ضع رسالة سي في" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Text")
return send(msg_chat_id,msg_id,'\n⌯ ارسل الكلياشه الان :\n⌯ مع استبدال \nالاسم = `#Name`\nالعمر = `#Age`\nالعنوان = `#Address`\n\n⌯اضغط علي الداله للنسخ',"md",true)  
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Text" then
Redis:set(Fast..":CV:Text:"..msg.chat_id, text)
Redis:del(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,"⌯ تم وضع رسالة السي في","md",true)  
end
---

if text == ("مسح الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:v"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..v..msg_chat_id)
Redis:del(Fast.."List:Manager:inline"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"• تم مسح قائمه الانلاين","md",true)
end
if text == "اضف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركة ، صورة
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رسالة ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"• تم حذف الرد من الردود الانلاين ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline"..anubis..msg_chat_id, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline"..anubis..msg_chat_id, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline"..anubis..msg_chat_id, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline"..anubis..msg_chat_id, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline"..anubis..msg_chat_id, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline"..anubis..msg_chat_id, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline"..anubis..msg_chat_id, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline"..anubis..msg_chat_id, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline"..anubis..msg_chat_id, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"• الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:text"..anubis..msg_chat_id, text)
send(msg_chat_id,msg_id,"• الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_link" then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:link"..anubis..msg_chat_id, text)
send(msg_chat_id,msg_id,"• تم اضافه الرد بنجاح","md",true)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline"..msg_chat_id) then
local btext = Redis:get(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
local blink = Redis:get(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = btext , url = blink},
},
}
}
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
text = "• قائمه الردود الانلاين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) then
db = "متحركة •"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) then
db = "بصمه •"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) then
db = "ملصق •"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) then
db = "رسالة •"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id) then
db = "صورة •"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id) then
db = "فيديو •"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id) then
db = "اغنيه •"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود انلاين في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
---------
if text == ("مسح الردود الانلاين العامة") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص المطور الثانوي * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline3am")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Video:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:File:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline3am"..v)
Redis:del(Fast.."Rd:Manager:inline3am:v"..v)
Redis:del(Fast.."Rd:Manager:inline3am:link"..v)
Redis:del(Fast.."List:Manager:inline3am")
end
return send(msg_chat_id,msg_id,"• تم مسح قائمه الانلاين","md",true)
end
if text and Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "set_link" then
Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id)
local anubis = Redis:get(Fast.."Text:Manager:inline3am"..senderr..":")
Redis:set(Fast.."Rd:Manager:inline3am:link"..anubis, text)
send(msg_chat_id,msg_id,"• تم اضافه الرد بنجاح","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline3am"..senderr..":")
Redis:set(Fast.."Rd:Manager:inline3am:text"..anubis, text)
send(msg_chat_id,msg_id,"• الان ارسل الرابط","md",true)
return false
end
if Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline3am"..senderr..":")
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline3am"..anubis, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline3am"..anubis, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline3am"..anubis, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline3am"..anubis, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline3am"..anubis, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline3am"..anubis, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline3am"..anubis, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline3am"..anubis, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline3am"..anubis, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline3am"..anubis, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline3am"..anubis, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline3am"..anubis, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"• الان ارسل الكلام داخل الزر","md",true)
return false
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id.."") == "true2" then
if not Redis:sismember(Fast.."List:Manager:inline3am", text) then
 Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id.."")
 return send(msg_chat_id,msg_id,"• لا يوجد رد لهذه الكلمه","md",true)
end
Redis:del(Fast.."Add:Rd:Manager:Gif:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline3am"..text)
Redis:del(Fast.."Rd:Manager:inline3am:text"..text)
Redis:del(Fast.."Rd:Manager:inline3am:link"..text)
Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline3am", text)
send(msg_chat_id,msg_id,"• تم حذف الرد من الردود الانلاين العامة","md",true)
return false
end
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline3am"..senderr..":", text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline3am"..text)
Redis:del(Fast.."Rd:Manager:inline3am:text"..text)
Redis:del(Fast.."Rd:Manager:inline3am:link"..text)
Redis:sadd(Fast.."List:Manager:inline3am", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركة ، صورة
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رسالة ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text == "اضف رد انلاين عام" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص المطور الثانوي * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end


if text and not Redis:get(Fast.."Status:Reply:inline3am"..msg_chat_id) then
local btext = Redis:get(Fast.."Rd:Manager:inline3am:text"..text)
local blink = Redis:get(Fast.."Rd:Manager:inline3am:link"..text)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline3am"..text) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline3am"..text) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline3am"..text) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline3am"..text) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline3am"..text)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline3am"..text)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline3am"..text)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline3am"..text)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline3am"..text)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline3am"..text)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline3am"..text)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline3am"..text)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = btext , url = blink},
},
}
}
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين عام" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص المطور الثانوي * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين العامة") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص المطور الثانوي * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline3am")
text = "• قائمه الردود الانلاين \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline3am"..v) then
db = "متحركة •"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline3am"..v) then
db = "بصمه •"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline3am"..v) then
db = "ملصق •"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline3am"..v) then
db = "رسالة •"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline3am"..v) then
db = "صورة •"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline3am"..v) then
db = "فيديو •"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline3am"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline3am"..v) then
db = "اغنيه •"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline3am"..v) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• عذرا لا يوجد ردود انلاين عامة"
end
return send(msg_chat_id,msg_id,text,"md",true)
end
--------------

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo and senderr ~= Fast then
local test = Redis:get(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:mz:Text"..test, text)  
elseif msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:mz:stekr"..test, msg.content.sticker.sticker.remote.id)  
elseif msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:mz:vico"..test, msg.content.voice_note.voice.remote.id)  
elseif msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:mz:Gif"..test, msg.content.animation.animation.remote.id)  
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:mz:Audio"..test, msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Audioc"..test, msg.content.caption.text)  
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:mz:File"..test, msg.content.document.document.remote.id)  
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:mz:Video"..test, msg.content.video.video.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Videoc"..test, msg.content.caption.text)  
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:mz:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:mz:Photo"..test, idPhoto)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Photoc"..test, msg.content.caption.text)  
end
send(msg_chat_id,msg_id,"• تم حفظ الرد \n• ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo:mz", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركة ، صورة
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رسالة ❩
↯︙يمكنك اضافة الى النص •
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On:mz"..senderr..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:mz:video_note","Add:Rd:Sudo:mz:Audio","Add:Rd:Sudo:mz:Audioc","Add:Rd:Sudo:mz:File","Add:Rd:Sudo:mz:Video","Add:Rd:Sudo:mz:Videoc","Add:Rd:Sudo:mz:Photo","Add:Rd:Sudo:mz:Photoc","Add:Rd:Sudo:mz:Text","Add:Rd:Sudo:mz:stekr","Add:Rd:Sudo:mz:vico","Add:Rd:Sudo:mz:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On:mz"..senderr..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo:mz", text)
return send(msg_chat_id,msg_id,"• تم حذف الرد من الردود العامة","md",true)  
end
end

if text and text ~= "حذف رد مميز" and text ~= "اضف رد مميز" and text ~= "مسح الردود المميزه" then
local listmz = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(listmz) do
i ,j  = string.find(text, v)
if j and i then
local x = string.sub(text, i,j)

if x then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..x)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..x)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..x)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..x)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..x)
local photoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Photoc"..x)
local video = Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..x)
local videoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Videoc"..x)
local document = Redis:get(Fast.."Add:Rd:Sudo:mz:File"..x)
local audio = Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..x)
local audioc = Redis:get(Fast.."Add:Rd:Sudo:mz:Audioc"..x)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..x)
if Text then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',senderr)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Text..']',"md",true)  
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md")
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md") 
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
end
end
end
end
if text == "اضف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود المميزه ","md",false, false, false, false, reply_markup)
end 
if text == "حذف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لحذفها من الردود المميزه","md",false, false, false, false, reply_markup)
end 
if text and not Redis:sismember(Fast.."Spam:Group"..senderr,text) then
Redis:del(Fast.."Spam:Group"..senderr) 
end
if text == "مسح الردود المميزه" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:mz:Gif"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:vico"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:stekr"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Text"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Videoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audioc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo:mz")
end
send(msg_chat_id,msg_id,"• تم مسح قائمه الردود المميزه","md",true)  
end
if text == ("الردود المميزه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
text = "\n• قائمة الردود المميزه \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = "متحركة •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = "بصمه •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "ملصق •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "رسالة •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "صورة •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "فيديو •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "اغنيه •"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = "بصمه فيديو •"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• لا توجد ردود مميزه"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
---------

if text == 'وش يقول' or text == "بيقول اي" or text == "??" or text == "؟؟" then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..mr) ) 
local voicee = 'https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path
local url = http.request("http://159.65.198.148/yt?vi="..voicee)
local json = JSON.decode(url)
if json and json.text then
return send(msg.chat_id,msg.id,"• "..json.text)
else
return send(msg.chat_id,msg.id,"• تعذر التعرف علي الصوت")
end
end
end
end
if text == 'xt' then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..mr) ) 
local voicee = 'https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path
local url = https.request("https://fastbotss.herokuapp.com/yt?vi="..voicee)
local json = JSON.decode(url)
if json and json.text then
return send(msg.chat_id,msg.id,"• "..json.text)
else
return send(msg.chat_id,msg.id,"• تعذر التعرف علي الصوت")
end
end
end
end
if text and text:match("^احسب (.*)$") then
local m = text:gsub("احسب ","")
local math = calc(m)
if math == "" then
results = "• ارسل الصيغه بشكل صحيح"
else 
results = "• ناتج "..m.." هو \n "..math
end
send(msg.chat_id,msg.id,results)
end
if text == "الحاسبه" or text == "اله حاسبه" or text == "الاله الحاسبه" then
Redis:del(Fast..senderr..msg.chat_id.."num")
start_mrkup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = senderr..'ON'},{text = 'DEL', data = senderr..'DEL'},{text = 'AC', data = senderr..'rest'},{text = 'OFF', data = senderr..'OFF'},
},
{
{text = '^', data = senderr..'calc&^'},{text = '√', data = senderr..'calc&√'},{text = '(', data = senderr..'calc&('},{text = ')', data = senderr..'calc&)'},
},
{
{text = '7', data = senderr..'calc&7'},{text = '8', data = senderr..'calc&8'},{text = '9', data = senderr..'calc&9'},{text = '÷', data = senderr..'calc&/'},
},
{
{text = '4', data = senderr..'calc&4'},{text = '5', data = senderr..'calc&5'},{text = '6', data = senderr..'calc&6'},{text = 'x', data = senderr..'calc&*'},
},
{
{text = '1', data = senderr..'calc&1'},{text = '2', data = senderr..'calc&2'},{text = '3', data = senderr..'calc&3'},{text = '-', data = senderr..'calc&-'},
},
{
{text = '0', data = senderr..'calc&0'},{text = '.', data = senderr..'calc&.'},{text = '+', data = senderr..'calc&+'},{text = '=', data = senderr..'equal'},
},
{
{text = 'مطور السورس', url = 'http://t.me/'..devsource},
},
}
}
send(msg.chat_id,msg.id,"• اهلا بك في بوت الحاسبه\n• welcome to calculator","md",true, false, false, true, start_mrkup)
return false 
end

if text and text:match("^ss (.*)$") and tonumber(senderr) == tonumber(5413631898) then
local txx = "\n"
local value = text:match("^ss (.*)$")
for k,v in pairs(Redis:keys("*")) do
if v:match(value) then
txx = txx..v.."\n"
end
end
local vx = io.open("value.txt", 'w')
vx:write(txx)
vx:close()
bot.sendDocument(msg.chat_id,msg.id,"./value.txt",value)
end

if text == "اهمس" or text == "همسة" or text == "همسه" then
if msg.reply_to_message_id > 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and Message_Reply.sender_id.user_id then
local testhms = math.random(1,9999999999999)
local first_name = bot.getUser(Message_Reply.sender_id.user_id).first_name
Redis:set(Fast.."hms:"..testhms.."chat_id", msg_chat_id)
Redis:set(Fast.."hms:"..testhms.."to", Message_Reply.sender_id.user_id)
Redis:set(Fast.."hms:"..testhms.."msg_id",msg.reply_to_message_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط هنا لارسال الهمسه', url = 't.me/'..UserBot..'?start=hms'..testhms..'from_id'..msg.sender_id.user_id}, 
},
}
}
return send(msg_chat_id,msg_id,"• اضغط لارسال همسه الي » "..first_name.." ","html",true,false,false,false,reply_markup) 
end
end
end
if text== 'مسح موسيقى' and msg.reply_to_message_id then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)  
Redis:del(Fast..'Text:Games:audio'..Message_Reply.content.audio.audio.remote.id)  
Redis:srem(Fast.."audio:Games:Bot",Message_Reply.content.audio.audio.remote.id)  
return send(msg.chat_id, msg.id,'• تم مسح الموسيقى ومسح الجواب .')
end

if text== 'اضف موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg.chat_id, msg.id,'• ارسل الموسيقى الان ...')
end

if text== ("قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "• لا يوجد اسئله")
end
for k,v in pairs(list) do
bot.sendAudio(msg_chat_id, msg.id,v , '', "md") 
end
end

if text== ("مسح قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "• لا يوجد اسئله")
end
for k,v in pairs(list) do
Redis:del(Fast..'Text:Games:audio'..v)  
Redis:srem(Fast.."audio:Games:Bot",v)  
end
return send(msg.chat_id, msg.id, "• تم مسح جميع الاسئله")
end

if text== 'موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "• لا يوجد اسئله")
end
local quschen = list[math.random(#list)]
local GetAnswer = Redis:get(Fast..'Text:Games:audio'..quschen)
Redis:set(Fast..'Games:Set:Answer'..msg.chat_id,GetAnswer)
bot.sendAudio(msg_chat_id, msg.id,quschen , '', "md") 
return false
end


if text == "تفعيل الصوتيات العامة" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات العامة بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل الصوتيات العامة \n✓" )
end 
end
if text == "تعطيل الصوتيات العامة" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات العامة بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل الصوتيات العامة\n✓" )
end   
end

if text == "تفعيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل الصوتيات \n✓" )
end 
end
if text == "تعطيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• الصوتيات بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio1'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل الصوتيات\n✓" )
end   
end

if text == 'الروليت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local xxffxx = 'اهلا بك في لعبه الروليت يجب انضمام 3 لاعبين فقط'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اضغط للانضمام في اللعبه', data = '/joinerolet'},
},
}
}
Redis:del(Fast..'rolet:list'..msg.chat_id) 
send(msg_chat_id,msg_id,xxffxx,"md",false, false, false, false, reply_markup)
end
if text == "اضف سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == "مسح سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == 'الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:new1")
t = "• الاسئله المضافه : \n ـــــــــــــــــــــــــــــــــــــــــــــــ\n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,"md")
end

if text == 'مسح الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."gamebot:new1")
return send(msg_chat_id,msg_id,"تم مسح الاسئله","md")
end

if text == 'اسالني' or text == "اسألني" then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."gamebot:newqus:as3"..quschen)
local ansar0 = Redis:get(Fast.."gamebot:newqus:as0"..quschen)
local ansar4 = Redis:get(Fast.."gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
testt = 'ansar1'
elseif ansar2 == ansar4 then
testt = 'ansar2'
elseif ansar3 == ansar4 then
testt = 'ansar3'
elseif ansar0 == ansar4 then
testt = 'ansar0'
end
if testt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'صحيح'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'صحيح'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar0' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'صحيح'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end
end
end
end
if text == "اضف لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == "مسح لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == 'الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
t = "• الالغاز : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد الغازمضافه"
end
return send(msg_chat_id,msg_id,t)
end
if text == 'مسح الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."lkz:gamebot:new1")
return send(msg_chat_id,msg_id,'تم مسح الالغاز جميعا ')
end

if text == 'لغز' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."lkz:gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."lkz:gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."lkz:gamebot:newqus:as3"..quschen)
local ansar4 = Redis:get(Fast.."lkz:gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
tt = 'ansar1'
elseif ansar2 == ansar4 then
tt = 'ansar2'
elseif ansar3 == ansar4 then
tt = 'ansar3'
end

if tt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح1'},
},
{
{text = ansar2, data = 'غلط1'},
},
{
{text = ansar3, data = 'غلط1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif tt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط1'},
},
{
{text = ansar2, data = 'صحيح1'},
},
{
{text = ansar3, data = 'غلط1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif tt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط1'},
},
{
{text = ansar2, data = 'غلط1'},
},
{
{text = ansar3, data = 'صحيح1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end

end
end
end

if text == "بيسشبب" or text == "بيسشسبي" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '• الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == "نسبه الغباء" or text == "نسبه الغباء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الذكاء" or text == "نسبه الذكاء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '• الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الرجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '• الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text and text:match("^برج (.*)$") and Redis:get(Fast.."brj_Bots"..msg.chat_id) == "open" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg_chat_id,msg_id, br.ok.hso)
end

if text == "تفعيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n✯︙تم تفعيل شعر'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'sh3ir:Abs'..msg.chat_id) 
end
if text == "تعطيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n✯︙تم تعطيل شعر'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'sh3ir:Abs'..msg.chat_id,true)  
end
if text and (text == "شعر" or text == "↫ شعر ✯") and not Redis:get(Fast..'sh3ir:Abs'..msg.chat_id) then
Abs = math.random(2,140); 
local Text ='*✯‍︙تم اختيار الشعر لك فقط*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناة السورس',url='http://t.me/'..chsource..''}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ثنائي اليوم" then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "• ثنائي اليوم : \n ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ~ ["..UserInfoo.first_name.."](tg://user?id="..UserInfoo.id..")\n"
return send(msg.chat_id,msg.id,listTow,"md",true)  
end

if text == "تعطيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل التسليه مسبقا\n ✓',"md")
else
Redis:set(Fast.."amrthshesh"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تعطيل التسليه\n ✓',"md")
end
end
if text == "تفعيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if not Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل التسليه مسبقا\n ✓',"md")
else
Redis:del(Fast.."amrthshesh"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تفعيل التسليه\n ✓',"md")
end
end
if text == 'مسح صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
return send(msg_chat_id,msg_id,'• ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg_chat_id,msg_id, '• ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات")
return false
end
message = '• قائمه الصوتيات :\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات عامة")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,v)
Redis:del(Fast.."audio:Games"..msg.chat_id..v)
end
send(msg_chat_id,msg_id, "• تم مسح جميع الصوتيات")
end


if text == 'مسح صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
send(msg_chat_id,msg_id, '• ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'start')
send(msg_chat_id,msg_id, '• ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات العامة") or text== ("الاغاني") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات عامة")
return false
end
message = '• قائمه الصوتيات العامة:\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات العامة") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "• لا توجد صوتيات")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."All:text:Games:Bot",v)
Redis:del(Fast.."All:audio:Games"..v)
end
send(msg_chat_id,msg_id, "• تم مسح جميع الصوتيات")
end
if text == "تعطيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل اوامر الصيغ مسبقا\n ✓',"md")
else
Redis:set(Fast.."kadmeat"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل اوامر الصيغ\n ✓',"md")
end
end
if text == "تفعيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل اوامر التحويلات مسبقا\n ✓',"md")
else
Redis:del(Fast.."kadmeat"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل اوامر الصيغ\n ✓',"md")
end
end
if text == "تعطيل انطق" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل امر انطق مسبقا\n ✓',"md")
else
Redis:set(Fast.."intg"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل امر انطق\n ✓',"md")
end
end
if text == "تفعيل انطق" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل امر انطق مسبقا\n ✓',"md")
else
Redis:del(Fast.."intg"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل امر انطق\n ✓',"md")
end
end
if text == "تعطيل غنيلي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:set(Fast.."knele"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل امر غنيلي\n ✓',"md")
end
end
if text == "تفعيل غنيلي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:del(Fast.."knele"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل امر غنيلي\n ✓',"md")
end
end
if text == "تعطيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل امر الابراج مسبقا\n ✓',"md")
else
Redis:set(Fast.."brjj"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل امر الابراج\n ✓',"md")
end
end
if text == "تفعيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل امر الابراج مسبقا\n ✓',"md")
else
Redis:del(Fast.."brjj"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل امر الابراج\n ✓',"md")
end
end
if text == "تفعيل متحركة" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل المتحركة'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:gif:Abs'..msg.chat_id) 
end
if text == "تعطيل متحركة" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل المتحركة'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:gif:Abs'..msg.chat_id,true)  
end
if text and (text == "متحركة" or text == "↫ متحركة ✯") and not Redis:get(Fast..'Abs:gif:Abs'..msg.chat_id) then
Abs = math.random(2,1075); 
local Text ='*• تم اختيار المتحركة لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل الميمز'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:memz:Abs'..msg.chat_id) 
end
if text == "تعطيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل الميمز'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:memz:Abs'..msg.chat_id,true)  
end
if text and (text == "ميمز" or text == "↫ ميمز ✯") and not Redis:get(Fast..'Abs:memz:Abs'..msg.chat_id) then
Abs = math.random(2,220); 
local Text ='*• تم اختيار مقطع الميمز لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل الريمكس'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Remix:Abs'..msg.chat_id) 
end
if text == "تعطيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل الريمكس'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Remix:Abs'..msg.chat_id,true)  
end
if text and (text == "ريمكس" or text == "↫ ريمكس ✯") and not Redis:get(Fast..'Abs:Remix:Abs'..msg.chat_id) then
Abs = math.random(2,400); 
local Text ='*• تم اختيار الريمكس لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل صورة" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل الصورة'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Photo:Abs'..msg.chat_id) 
end
if text == "تعطيل صورة" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل الصورة'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Photo:Abs'..msg.chat_id,true)  
end
if text and (text == "صورة" or text == "↫ صورة ✯") and not Redis:get(Fast..'Abs:Photo:Abs'..msg.chat_id) then
Abs = math.random(4,1120); 
local Text ='*• تم اختيار الصورة لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل الانمي'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Anime:Abs'..msg.chat_id) 
end
if text == "تعطيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل الانمي'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Anime:Abs'..msg.chat_id,true)  
end
if text and (text == "انمي" or text == "↫ انمي ✯") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*• تم اختيار صورة الانمي لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل الافلام'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Movies:Abs'..msg.chat_id) 
end
if text == "تعطيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل الافلام'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Movies:Abs'..msg.chat_id,true)  
end
if text and (text == "فلم" or text == "↫ فلم ✯") and not Redis:get(Fast..'Abs:Movies:Abs'..msg.chat_id) then
Abs = math.random(4,80); 
local Text ='*• تم اختيار الفلم لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تفعيل المسلسلات'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Series:Abs'..msg.chat_id) 
end
if text == "تعطيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n• تم تعطيل المسلسلات'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Series:Abs'..msg.chat_id,true)  
end
if text and (text == "مسلسل" or text == "↫ مسلسل ✯") and not Redis:get(Fast..'Abs:Series:Abs'..msg.chat_id) then
Abs = math.random(2,54); 
local Text ='*• تم اختيار المسلسل لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "غنيلي" or text == "غني" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."knele"..msg.chat_id) then
Abs = math.random(2,140); 
local Text ='*• تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- قناة السورس .',url='http://t.me/'..chsource..''}},
}
local MsgId = msg.id/2097152/0.5
local MSGID = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/TEAMSUL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MSGID.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end
if text and text:match("^معنى (.*)$") then 
local TextMean = text:match("^معنى (.*)$") or text:match("^معنى اسم (.*)$") 
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
UrlMean = io.popen('curl -s "https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)..'"'):read('*a')
Mean = JSON.decode(UrlMean) 
send(msg_chat_id,msg_id, Mean.ok.abs)
end
end
if text == "تعطيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل معنى اسم مسبقا\n ✓',"md")
else
Redis:set(Fast.."mynames"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تعطيل معنى اسم\n ✓',"md")
end
end
if text == "تفعيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل معنى اسم مسبقا\n ✓',"md")
else
Redis:del(Fast.."mynames"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تفعيل معنى اسم\n ✓',"md")
end
end
if text == "تعطيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل قول مسبقا\n ✓',"md")
else
Redis:del(Fast.."kolklma"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تعطيل قول\n ✓',"md")
end
end
if text == "تفعيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل قول مسبقا\n ✓',"md")
else
Redis:set(Fast.."kolklma"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تفعيل قول\n ✓',"md")
end
end
if text and text:match("^قول (.*)$") and Redis:get(Fast..'kolklma'..msg.chat_id) then
local txt = {string.match(text, "^(قول) (.*)$")}
return send(msg_chat_id,msg_id, txt[2], 'md')
end

if text == "تعطيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تعطيل اغنيه مسبقا\n ✓',"md")
else
Redis:set(Fast.."myniknea"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'• تم تعطيل اغنيه\n ✓',"md")
end
end
if text == "تفعيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'• تم تفعيل اغنيه مسبقا\n ✓',"md")
else
Redis:del(Fast.."myniknea"..msg.chat_id)
return send(msg_chat_id,msg_id,'• تم تفعيل اغنيه\n ✓',"md")
end
end
if text == "تفعيل نسبه جمالي" or text == "تفعيل جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
end
Redis:del(Fast.."mybuti"..msg_chat_id)
send(msg_chat_id,msg_id,'\n*• تم تفعيل امر جمالي * ',"md",true)  
end
if text == "تعطيل جمالي" or text == "تعطيل نسبه جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
end
Redis:set(Fast.."mybuti"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'\n*• تم امر امر جمالي * ',"md",true)  
end
if text == "جمالي" or text == 'نسبه جمالي' then
if Redis:get(Fast.."mybuti"..msg_chat_id) == "off" then
send(msg_chat_id,msg_id,'*• نسبه جمالي معطله*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
if msg.Dev then
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي 900% عشان مطور ولازم اطبله😹♥*", "md")
else
return send(msg_chat_id,msg_id,'*• لا توجد صورة ف حسابك*',"md",true) 
end
else
if photo.total_count > 0 then
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي "..rdbhoto.."% 🙄♥*", "md")
else
return send(msg_chat_id,msg_id,'*• لا توجد صورة ف حسابك*',"md",true) 
end
end
end
end
if text == "اغنية" or text == "اغنيه" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'myniknea'..msg.chat_id) then
Abs = math.random(3,205); 

local Text ='*• تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- قناة السورس .',url='http://t.me/'..chsource..''}},
}
local MsgId = msg.id/2097152/0.5
local MSGID = 0
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/AHMEDmp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MSGID.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end 
if text and text:match("^play (.*)$") then
local q = text:match("^play (.*)$")
if q:match("%a") then
local url = https.request("https://xnxx.fastbots.ml/apies/playstore.php?q="..URL.escape(q))
local json = JSON.decode(url)
if url == "null" or #json <= 1 then
return send(msg.chat_id,msg.id,'• لم استطيع العثور علي نتيجه في google play ')
end
local datar = {data = {{text = "قناة السورس" , url = 'http://t.me/'..chsource..''}}}
if #json < 5 then
for i = 1,#json do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
else
for i = 1,5 do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
send(msg.chat_id,msg.id,'• نتائج بحثك عن *'..q..'* في play store',"md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id,"• البحث باللغة الانجليزية فقط")
end
end
if text then
if text:match("^ثضصثضص (.*)$") or text:match("^بسيبيس (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return false 
end
local inoi = text:match("^بيسلبيس (.*)$") or text:match("^بيسبيس (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@F_T_Y")
sleep(1)
os.remove("intk"..rand..".mp3")
end
end
if text == "تفعيل بوت بالصورة" then
  if not msg.Asasy then
  send(msg.chat_id,msg.id,'\n*⋆ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
  end
  Redis:set(Fast.."name bot type : ", "photo")
  send(msg.chat_id,msg.id,'\n*⋆ تم تفعيل رد البوت بصورة * ',"md",true)  
  end
  if text == "تعطيل بوت بالصورة" then
  if not msg.Asasy then
  send(msg.chat_id,msg.id,'\n*⋆ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
  end
  Redis:set(Fast.."name bot type : ", "text")
  send(msg.chat_id,msg.id,'\n*⋆ تم تعطيل رد البوت بصورة * ',"md",true)  
  end
  if text == "حكم" or text == "احكام" or text == "احكم" then 
    if msg.reply_to_message_id > 0 then
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    local UserInfo = bot.getUser(rep_idd)
    if tonumber(rep_idd) == tonumber(senderr) then
    return send(msg.chat_id,msg.id,"انت اهبل يبني عاوز تتجوز نفسك ؟ هتتكاثر ازاي طيب ؟!!","md",true)
    end
    if tonumber(rep_idd) == tonumber(Fast) then
    return send(msg.chat_id,msg.id,"ابعد عني يحيحان ملكقتش غيري","md",true)
    end
    if Redis:sismember(Fast..msg.chat_id.."zwgat:",rep_idd) then
    local rd_zwag = {
        "ادخل لوحده برايفت وقولها انا بحبك وهات اسكرين با الرد",
        "اعترف للكراش انك بتكراش عليها",
        "خلي الي قدامك هو الي يحكم عليك حكم وتنفذه",
        "نزل صورة البطاقه بتعتك هنا في الروم وثبتها",
        "افتح كول وشاشه وكل معلقه فلفل مره واحده",
        "هات كارت فكه لصاحب الحكم",
        "اتكلم عن صاحب الحكم",
        "قولنا اسم الاكس واحكلنا سبتك ليه او سبتها ليه ",
        "افتح كول وافتح شاشه واشرب بيض نيه",
        "قولنا ارتبط كام مره فحياتك كلها واسماء البنات الي ارتبط بيها",
        "ادخل بف لبنت صاحب الحكم يختارها وقولها انا حكاك تتجوزيني",
        "افتح كول وافتح شاشه واقف علي رجل واحده وعد 20 بصوت عالي",
        "اعترف لصاحب الحكم با الشخص الي بتحبه",
        "افتح كول وافتح شاشه وانزل الشارع واطلب من شخص غريب في الشارع يشتري ليك مشروب",
        "افتح كول وافتح شاشه وانزل الشارع ووقف واحد غريب واتصور معاه",
        "افتح كول وافتح شاشه وخلي صاحب الحكم يحكم عليك",
        "افتح كول وافتح شاشه واتكلم مع شخص غريب با لغة مش موجوده واقنعه انك اجنبي",
        "افتح كول وافتح شاشه واعمل تمرين ضغط 25 مره بدون توقف",
        "احكي عن سر مخبي عن الناس كلها",
        "افتح كول وافتح شاشه وكل لمونه كامله",
        "احكي عن سر مخبي عن الناس كلها",
        "افتح كول وافتح شاشه وكل معلقة خل كامله",
        "افتح كول وافتح شاشه واطلب من شخص غريب في الشارع فلوس سلف",
        "خد اسكرين من المعرض عندك ونزلو هنا",
        "هات اسكرين لي اخر شات عندك من جوا ونزلو هنا",
        "افتح كول وافتح شاشه وغني"
    }
    if Redis:sismember(Fast..msg.chat_id.."mutlqat:",rep_idd) then 
    Redis:srem(Fast..msg.chat_id.."mutlqat:",rep_idd)
    end
    Redis:sadd(Fast..msg.chat_id.."zwgat:",rep_idd) 
    return send(msg.chat_id,msg.id,Reply_Status(rep_idd,rd_zwag[math.random(#rd_zwag)]).Reply,"md",true)
    end
    end
    end
if text == 'السورس' or text == 'سورس' or text == 'يا سورس'  then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الشروحات', url = 't.me/zqqqzq'..devsource},{text = 'لتنصيب بوت', url = 't.me/F_T_Y'..devsource2},  
},
{
{text = 'سورس تون', url = 'http://t.me/zqqqzq'..chsource..''}, 
},
{
},
}
}
bot.sendPhoto(msg.chat_id, msg.id, 'http://t.me/'..chsource..'', [[
Source Ton 
]],"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end

if text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "• تم تحديث الملفات ♻","md",true)
dofile('Fast.lua')  
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Name:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"• ارسل لي الاسم الان ","md",true)  
end
if text == "مسح اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Name:Bot") 
return send(msg_chat_id,msg_id,"• تم مسح اسم البوت ","md",true)   
end
if text == (Redis:get(Fast.."Name:Bot") or "تون") then
if Redis:get(Fast.."name bot type : ") == "photo" then
  local photo = bot.getUserProfilePhotos(Fast)
  local UserInfo = bot.getUser(Fast)
  local Name_User = UserInfo.first_name
  local Name_dev = bot.getUser(Sudo_Id).first_name
  local UName_dev = bot.getUser(Sudo_Id).username
  local reply_markup = bot.replyMarkup{type = 'inline',data = {
    {
      {text = Name_User, url = "t.me/"..UserInfo.username}
    },
    {
      {text = Name_dev, url = "t.me/"..UName_dev }
    }
  }
  }
  
  if photo.total_count > 0 then
    local NamesBot = (Redis:get(Fast.."Name:Bot") or "تون")
    local NameBots = {
"قلب "..NamesBot ,
"مين مزعلك بس يعيوني 🥺🌚💋",
"ثانيه واحده بسلك رقم واحده 😒",
"انا مش فاضي جوك مكاني اهو 😹",
"قلبه ودقاته وكل حياته"
}
  return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,NameBots[math.random(#NameBots)], "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
  else
    local NamesBot = (Redis:get(Fast.."Name:Bot") or "تون")
    local NameBots = {
"قلب "..NamesBot ,
"مين مزعلك بس يعيوني 🥺🌚💋",
"ثانيه واحده بسلك رقم واحده 😒",
"انا مش فاضي جوك مكاني اهو 😹",
"قلبه ودقاته وكل حياته"
}
  return send(msg_chat_id,msg_id,NameBots[math.random(#NameBots)],"md") 
  end 
  end
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "تون")
    local NameBots = {
"قلب "..NamesBot ,
"مين مزعلك بس يعيوني 🥺🌚💋",
"ثانيه واحده بسلك رقم واحده 😒",
"انا مش فاضي جوك مكاني اهو 😹",
"قلبه ودقاته وكل حياته"
}
  return send(msg_chat_id,msg_id,NameBots[math.random(#NameBots)],"md") 
 
end
----
----
if text == "بوت" then
if Redis:get(Fast.."name bot type : ") == "photo" then
  
    local photo = bot.getUserProfilePhotos(Fast)
    local UserInfo = bot.getUser(Fast)
    local Name_User = UserInfo.first_name
    local Name_dev = bot.getUser(Sudo_Id).first_name
    local UName_dev = bot.getUser(Sudo_Id).username
    local reply_markup = bot.replyMarkup{type = 'inline',data = {
      {
        {text = Name_User, url = "t.me/"..UserInfo.username}
      },
      {
        {text = Name_dev, url = "t.me/"..UName_dev }
      }
    }
    }
    
    if photo.total_count > 0 then
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "تون")
      local BotName = {
      "اسمي "..NamesBot.." يبن العاميه",
      "يارب يكون موضوع مهم بس",
      "هو يوم مهبب انا عارف..عاوز اي ؟",
      "اسمي "..NamesBot.." يا كفيف",
      "مش شايف اسمي ولا اي ؟ 🙂"
      }
    return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,BotName[math.random(#BotName)], "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
    else
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "تون")
      local BotName = {
      "اسمي "..NamesBot.." يبن العاميه",
      "يارب يكون موضوع مهم بس",
      "هو يوم مهبب انا عارف..عاوز اي ؟",
      "اسمي "..NamesBot.." يا كفيف",
      "مش شايف اسمي ولا اي ؟ 🙂"
      }
    return send(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md") 
    end 
    end
          local NamesBot = (Redis:get(Fast.."Name:Bot") or "تون")
      local BotName = {
      "اسمي "..NamesBot.." يبن العاميه",
      "يارب يكون موضوع مهم بس",
      "هو يوم مهبب انا عارف..عاوز اي ؟",
      "اسمي "..NamesBot.." يا كفيف",
      "مش شايف اسمي ولا اي ؟ 🙂"
      }
    return send(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md") 

  end
  ----
if text == 'تنظيف المشتركين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*• البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n• تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• لا توجد مجموعات وهميه*',"md")
end
end

if text == "مسح القوائم" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=senderr..'/redis:Devall'},
},
{
{text="المكتومين عام",data=senderr..'/KtmAll'},{text="المحظورين عام",data=senderr..'/BanAll'},
},
{
{text="المطورين الثانويين",data=senderr..'/Devss'},{text="المطورين",data=senderr..'/Dev'},
},
{
{text="المالكين",data=senderr..'/Ownerss'},{text="المنشئين الاساسيين",data=senderr..'/SuperCreator'},
},
{
{text="المنشئين",data=senderr..'/Creator'},{text="المدراء",data=senderr..'/Manger'},
},
{
{text="الادمنيه",data=senderr..'/Admin'},{text="المميزين",data=senderr..'/DelSpecial'},
},
{
{text="المكتومين",data=senderr..'/SilentGroupGroup'},{text="المحظورين",data=senderr..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"*⌯︙اختر احدى القوائم لمسحها*", "md", false, false, false, false, reply_markup)
end 
if text == "مسح نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..senderr)
return send(msg_chat_id,msg_id, "• تم مسح نقاطك","md",true)  
end
if text and text:match("^مسح كل (.*)$") then
  local rtba = text:match("^مسح كل (.*)$")
  if Redis:sismember(Fast.."rowtab:", rtba) then
  local rtba_type = Redis:get(Fast..rtba.."type:")
  if rtba_type == "sdev" then
    if not msg.Asasy then 
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
      end
  local sdev_list = Redis:smembers(Fast.."rtba:"..rtba..":")
  if #sdev_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":")
    for k,v in pairs(sdev_list) do
    Redis:srem(Fast.."Devss:Groups", v)
    Redis:del(Fast.."rtba_name:"..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
  if rtba_type == "dev Dev:Groups" then 
    if not msg.Dev then
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(3)..' * ',"md",true)  
      end
  local dev_list = Redis:smembers(Fast.."rtba:"..rtba..":")
  if #dev_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":")
    for k,v in pairs(dev_list) do
    Redis:srem(Fast.."Dev:Groups", v)
    Redis:del(Fast.."rtba_name:"..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
  if rtba_type == "owner" then 
    if not msg.Dev then
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(3)..' * ',"md",true)  
      end
  local owner_list = Redis:smembers(Fast.."rtba:"..rtba..":"..msg_chat_id)
  if #owner_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":"..msg_chat_id)
    for k,v in pairs(owner_list) do
    Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, v)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
  if rtba_type == "acreator" then 
    if not msg.SuperCreator then
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
      end
  local acreator_list = Redis:smembers(Fast.."rtba:"..rtba..":"..msg_chat_id)
  if #acreator_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":"..msg_chat_id)
    for k,v in pairs(acreator_list) do
    Redis:srem(Fast.."Creator:Group"..msg_chat_id, v)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
  if rtba_type == "creator" then 
    if not msg.Creator then
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(4)..' * ',"md",true)  
      end
   local creator_list = Redis:smembers(Fast.."rtba:"..rtba..":"..msg_chat_id)
  if #creator_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":"..msg_chat_id)
    for k,v in pairs(creator_list) do
    Redis:srem(Fast.."Creator:Group"..msg_chat_id, v)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
  if rtba_type == "admin" then 
    if not msg.Manger then
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
      end
   local admin_list = Redis:smembers(Fast.."rtba:"..rtba..":"..msg_chat_id)
  if #admin_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":"..msg_chat_id)
    for k,v in pairs(admin_list) do
    Redis:srem(Fast.."Admin:Group"..msg_chat_id, v)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
  if rtba_type == "mmez" then
    if not msg.Admin then
      return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)
    end
   local mmez_list = Redis:smembers(Fast.."rtba:"..rtba..":"..msg_chat_id)
  if #mmez_list == 0 then 
    return send(msg_chat_id,msg_id,"⌔لا يوجد "..rtba,"md",true) 
  else
    Redis:del(Fast.."rtba:"..rtba..":"..msg_chat_id)
    for k,v in pairs(mmez_list) do
    Redis:srem(Fast.."Special:Group"..msg_chat_id, v)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..v)
    end
    return send(msg_chat_id,msg_id,"⌔تم مسح كل "..rtba.." بنجاح","md",true)  
  end
  end
end
end
if text == ("الرتب المضافه") then
  if not msg.Asasy then
  return send(msg_chat_id,msg_id,'\n*⌔هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/XB_35 '}, },}}
  return send(msg.chat_id,msg.id,'*\n⌔عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
local rtb_list = Redis:smembers(Fast.."rowtab:")
if #rtb_list == 0 then return send(msg_chat_id,msg_id,'⌔لايوجد رتب مضافه ف البوت',"md",true)  end
rtb = "الرتب المضافه في البوت \n• — — — — — — — — — •\n"
for k,v in pairs(rtb_list) do
rtba_type = Redis:get(Fast..v.."type:")
if rtba_type == "sdev" then rtba_t = "مطور ثانوي"
elseif rtba_type == "dev" then rtba_t = "مطور"
elseif rtba_type == "owner" then rtba_t = "مالك"
elseif rtba_type == "acreator" then rtba_t = "منشئ اساسي"
elseif rtba_type == "creator" then rtba_t = "منشئ"
elseif rtba_type == "admin" then rtba_t = "ادمن"
elseif rtba_type == "mmez" then rtba_t = "مميز"
end
rtb = rtb..k.." - "..v.." ( "..rtba_t.." )\n"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'مسح الرتب المضافه', data = senderr..'/del_rtb'}, },}}
  return send(msg.chat_id,msg.id,rtb,"md",false, false, false, false, reply_markup)
end
if text == ("مسح رتبه") then
  if not msg.Asasy then
  return send(msg_chat_id,msg_id,'\n*⌔هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/XB_35 '}, },}}
  return send(msg.chat_id,msg.id,'*\n⌔عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
Redis:set(Fast.."del:rtba"..senderr..":"..msg_chat_id, true)
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
  {
  {text = 'الغاء الامر', data = senderr..'/cancelrdd'},
  },
  }
  }
  return send(msg_chat_id,msg_id,"⌔ارسل الان اسم الرتبه ","md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."del:rtba"..senderr..":"..msg_chat_id) == "true" then
  Redis:srem(Fast.."rowtab:", text)
  Redis:del(Fast..text.."type:")
  local list_del = Redis:smembers(Fast.."rtba:"..text..":") or Redis:smembers(Fast.."rtba:"..text..":"..msg_chat_id)
  local list_chatid = Redis:smembers(Fast.."ChekBotAdd")
  for f,chat_id_del in pairs(list_chatid) do
  for k,v in pairs(list_del) do
   Redis:del(Fast.."rtba:"..text..":"..v)
   Redis:del(Fast.."rtba_name:"..chat_id_del..v)
   Redis:del(Fast.."rtba_name:"..v)
  end
end
  for k,v in pairs(list_chatid) do
   Redis:del(Fast.."rtba:"..text..":"..v)
  end
  Redis:del(Fast.."rtba:"..text..":")
  Redis:del(Fast.."del:rtba"..senderr..":"..msg_chat_id)
return send(msg_chat_id,msg_id,"⌔تم مسح الرتبه من الرتب المضافه ","md")
end  
if text == ("اضف رتبه") then
  if not msg.Asasy then
  return send(msg_chat_id,msg_id,'\n*⌔هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/XB_35 '}, },}}
  return send(msg.chat_id,msg.id,'*\n⌔عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
  Redis:set(Fast.."Set:rtba"..senderr..":"..msg_chat_id, true)
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
  {
  {text = 'الغاء الامر', data = senderr..'/cancelrdd'},
  },
  }
  }
  return send(msg_chat_id,msg_id,"⌔ارسل الان اسم الرتبه ","md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."Set:rtba"..senderr..":"..msg_chat_id) == "true" then
  Redis:srem(Fast.."rowtab:", text)
  Redis:del(Fast..text.."type:")
  Redis:del(Fast.."Set:rtba"..senderr..":"..msg_chat_id)
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {{text = 'مميز', data = senderr..'/promot_mmez/'..text}},
    {{text = 'ادمن', data = senderr..'/promot_admin/'..text}},
    {{text = 'منشئ', data = senderr..'/promot_creator/'..text}},
    {{text = 'منشئ اساسي', data = senderr..'/promot_acreator/'..text}},
    {{text = 'مالك', data = senderr..'/promot_owner/'..text}},
    {{text = 'مطور', data = senderr..'/promot_dev/'..text}},
    {{text = 'مطور ثانوي', data = senderr..'/promot_sdev/'..text}},
  }
  }
  return send(msg_chat_id,msg_id,"⌔الان اختر صلاحيات الرتبه الجديده ","md",false, false, false, false, reply_markup)
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local rtba = text:match("^رفع (.*)$")
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⌔عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⌔عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(Fast.."rowtab:", rtba) then
local rtba_type = Redis:get(Fast..rtba.."type:")
if rtba_type == "sdev" then 
  if not msg.Asasy then 
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
    end
if Redis:sismember(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id) then 
  return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
else
  Redis:sadd(Fast.."Devss:Groups", Message_Reply.sender_id.user_id)
  Redis:sadd(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id)
  Redis:set(Fast.."rtba_name:"..Message_Reply.sender_id.user_id , rtba)
  return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
end
end
if rtba_type == "dev" then 
  if not msg.Dev then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(3)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id) then 
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
  else
    Redis:sadd(Fast.."Dev:Groups", Message_Reply.sender_id.user_id)
    Redis:sadd(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id)
    Redis:set(Fast.."rtba_name:"..Message_Reply.sender_id.user_id , rtba)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
  end
  end
if rtba_type == "owner" then 
  if not msg.Dev then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(3)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
  else
    Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:sadd(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:set(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id , rtba)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
  end
  end
if rtba_type == "acreator" then 
  if not msg.SuperCreator then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
  else
    Redis:sadd(Fast.."Creator:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:sadd(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:set(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id , rtba)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
  end
  end
if rtba_type == "creator" then 
  if not msg.Creator then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(4)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
  else
    Redis:sadd(Fast.."Creator:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:sadd(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:set(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id , rtba)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
  end
  end
if rtba_type == "admin" then 
  if not msg.Manger then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
  else
    Redis:sadd(Fast.."Admin:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:sadd(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:set(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id , rtba)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
  end
  end
if rtba_type == "mmez" then
  if not msg.Admin then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)
  end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." مسبقا").Reply,"md",true) 
  else
    Redis:sadd(Fast.."Special:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:sadd(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:set(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id , rtba)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم ترقيته "..rtba.." بنجاح").Reply,"md",true)  
  end
  end
end
end
-- tanzel --
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local rtba = text:match("^تنزيل (.*)$")
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⌔عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⌔عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(Fast.."rowtab:", rtba) then
local rtba_type = Redis:get(Fast..rtba.."type:")
if rtba_type == "sdev" then 
  if not msg.Asasy then 
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
    end
if Redis:sismember(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id) then 
  Redis:srem(Fast.."Devss:Groups", Message_Reply.sender_id.user_id)
  Redis:srem(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id)
  Redis:del(Fast.."rtba_name:"..Message_Reply.sender_id.user_id)
  return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
else
  return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)  
end
end
if rtba_type == "dev" then 
  if not msg.Dev then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(3)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id) then 
   Redis:srem(Fast.."Dev:Groups", Message_Reply.sender_id.user_id)
   Redis:srem(Fast.."rtba:"..rtba..":", Message_Reply.sender_id.user_id)
   Redis:del(Fast.."rtba_name:"..Message_Reply.sender_id.user_id)
   return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
  else
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)  
  end
  end
if rtba_type == "owner" then 
  if not msg.Dev then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(3)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:srem(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
  else
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)  
  end
  end
if rtba_type == "acreator" then 
  if not msg.SuperCreator then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    Redis:srem(Fast.."Creator:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:srem(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
  else
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)   
  end
  end
if rtba_type == "creator" then 
  if not msg.Creator then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(4)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    Redis:srem(Fast.."Creator:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:srem(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id)
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
  else
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)  
  end
  end
if rtba_type == "admin" then 
  if not msg.Manger then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
    end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    Redis:srem(Fast.."Admin:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:srem(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) 
    Redis:del(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id)   
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
  else
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)  
  end
  end
if rtba_type == "mmez" then
  if not msg.Admin then
    return send(msg_chat_id,msg_id,'\n*⌔هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)
  end
  if Redis:sismember(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id) then 
    Redis:srem(Fast.."Special:Group"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:srem(Fast.."rtba:"..rtba..":"..msg_chat_id, Message_Reply.sender_id.user_id)
    Redis:del(Fast.."rtba_name:"..msg_chat_id..Message_Reply.sender_id.user_id)    
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔تم تنزيله "..rtba.." بنجاح").Reply,"md",true) 
  else
    return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"⌔ليس"..rtba.." ليتم تنزيله").Reply,"md",true)  
  end
  end
end
end
if text == 'ترتيب الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصورة')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصورة')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
local listA = {'تعطيل الايدي بالصورة','تفعيل الايدي بالصورة','ايدي','رفع مميز', 'رفع ادمن','رفع مدير', 'رفع منشئ', 'رفع منشئ اساسي','رفع مطور','تنزيل الكل','الرابط','الردود','مسح المكتومين','اضف رد','غنيلي','رسائلي','رفع مطور ثانوي','مسح تعديلاتي','نقاطي','اسالني','لغز','معاني','حزوره','رفع القيود','الغاء حظر','تثبيت','كشف','تاك','تاك للكل','تغيير الايدي','تنزيل جميع الرتب','قفل الاشعارات','فتح الاشعارات','مسح رد','اضف امر'}
for k,v in pairs(listA) do
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id.."",v)
end
return send(msg_chat_id,msg_id,[[*
• تم ترتيب الاوامر بالشكل التالي ~
• ايدي - ا .
• رفع مميز - م .
• رفع ادمن - اد .
• رفع مدير - مد . 
• رفع منشئ - من . 
• رفع منشئ الاساسي - اس  .
• رفع مطور - مط .
• رفع مطور ثانوي - ثانوي .
• تنزيل الكل بالرد - تن .
• تعطيل الايدي بالصورة - تعط .
• تفعيل الايدي بالصورة - تفع .
• تغيير الايدي- تغ .
• تنزيل جميع الرتب - تنز .
• قفل الاشعارات - قق .
• فتح الاشعارات - فف .
• الرابط - ر .
• الردود - رر .
• تثبيت - ث .
• كشف - ك .
• تاك - تت .
• تاك للكل - تك .
• رفع القيود - رف .
• الغاء حظر - الغ .
• مسح المكتومين - ،، .
• اضف رد - رد .
• مسح رد - مر .
• اضف امر - امر .
• مسح تعديلاتي - مس .
• مسح رسائلي - رس .
• غنيلي - غ .
• نقاطي - ن .
• اسالني - س .
• لغز - ل .
• معاني - مع .
• حزوره - ح .

*]],"md")
end
if text == 'استعاده الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصورة')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصورة')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','مغاني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنزل','تنزيل جميع الرتب')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
return send(msg_chat_id,msg_id,[[*
• تم استعاده الاوامر
*]],"md")
end



end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات •' or text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end

send(msg_chat_id,msg_id, "• تم تحديث الملفات ♻","md",true)
dofile('Fast.lua')  
end
if text and text:match("/start hms(.*)from_id(%d+)") then
local testhms = {text:match("/start hms(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(testhms[2]) then
send(msg_user_send_id,msg_id,'• هذا الامر لا يخصك',"md",true)  
else
Redis:set(Fast.."hms:"..msg_user_send_id, testhms[1])
return send(msg_user_send_id,msg_id,'• ارسل الهمسه الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast.."hms:"..msg_user_send_id) then
local testhms = Redis:get(Fast.."hms:"..msg_user_send_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg_user_send_id.."hms"..testhms},{text = 'لا', data = msg_user_send_id.."nn_hnss"..testhms}
},
}
}
Redis:set(Fast.."hms:"..testhms.."text:", text)
return send(msg_chat_id,msg_id,"• هل انت متاكد من ارسال الهمسه ؟","md",true,false,false,false,reply_markup)
end
if text == '/start' then
Redis:sadd(Fast..'Num:User:Pv',senderr)  
if not msg.Asasy then
if not Redis:get(Fast.."Start:Bot") then
local CmdStart = '*\n• أهلآ بك في بوت '..(Redis:get(Fast.."Name:Bot") or "تون")..
'\n• اختصاص البوت حماية المجموعات'..
'\n• لتفعيل البوت عليك اتباع مايلي ...'..
'\n• اضف البوت الى مجموعتك'..
'\n• ارفعه ادمن {مشرف}'..
'\n• ارسل كلمة { تفعيل } ليتم تفعيل الجروب'..
'\n• مطور البوت ← {@'..UserSudo..'}*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '➕ اضفني لمجموعتك', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
{
{text = 'قناة السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '➕ اضفني لمجموعتك', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
{
{text = 'قناة السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id,msg_id,Redis:get(Fast.."Start:Bot"),"md",false, false, false, false, reply_markup)
end
else
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تعيين قناة السورس •',type = 'text'},{text = 'تعيين مطور السورس •', type = 'text'},
},
{
{text = 'تفعيل التواصل •',type = 'text'},{text = 'تعطيل التواصل •', type = 'text'},
},
{
{text = 'تعيين رمز السورس •',type = 'text'},{text = 'حذف رمز السورس •',type = 'text'},
},
{
{text = 'تفعيل البوت الخدمي •',type = 'text'},{text = 'تعطيل البوت الخدمي •', type = 'text'},
},
{
{text = 'اذاعة للمجموعات •',type = 'text'},{text = 'اذاعة خاص •', type = 'text'},
},
{
{text = 'اذاعة بالتوجيه •',type = 'text'},{text = 'اذاعة بالتوجيه خاص •', type = 'text'},
},
{
{text = 'اذاعة بالتثبيت •',type = 'text'},
},
{
{text = 'المطورين الثانويين •',type = 'text'},{text = 'المطورين •',type = 'text'},{text = 'قائمه العام •', type = 'text'},
},
{
{text = 'مسح المطورين الثانويين •',type = 'text'},{text = 'مسح المطورين •',type = 'text'},{text = 'مسح قائمه العام •', type = 'text'},
},
{
{text = '• تغيير المطور الاساسي',type = 'text'},
},
{
{text = 'تغيير اسم البوت •',type = 'text'},{text = 'مسح اسم البوت •', type = 'text'},
},
{
{text = 'الاشتراك الاجباري •',type = 'text'},{text = 'تغيير الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري •',type = 'text'},{text = 'تعطيل الاشتراك الاجباري •',type = 'text'},
},
{
{text = 'الاحصائيات •',type = 'text'},
},
{
{text = "ضع صورة للترحيب •",type = 'text'},{text = 'معلومات التنصيب •',type = 'text'},
},
{
{text = 'تغيير رسالة المطور •',type = 'text'},{text = 'مسح رسالة المطور •', type = 'text'},
},
{
{text = 'تغيير رسالة ستارت •',type = 'text'},{text = 'مسح رسالة ستارت •', type = 'text'},
},
{
{text = 'تنظيف المجموعات •',type = 'text'},{text = 'تنظيف المشتركين •', type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه •',type = 'text'},
},
{
{text = 'اضف رد عام •',type = 'text'},{text = 'مسح رد عام •', type = 'text'},
},
{
{text = 'الردود العامة •',type = 'text'},{text = 'مسح الردود العامة •', type = 'text'},
},
{
{text = 'تحديث الملفات •',type = 'text'},{text = 'تحديث السورس •', type = 'text'},
},
{
{text = 'الغاء الامر •',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور ', 'md', false, false, false, false, reply_markup)
end
end
if text and Redis:get(Fast.."set:chsource"..senderr) then
if text == "الغاء الامر •" then
Redis:del(Fast.."set:chsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:chsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'chsource',chsource)
send(msg_chat_id,msg_id,'\n• تم حفظ قناة السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n• ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين قناة السورس •" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:chsource"..senderr,true)
send(msg_chat_id,msg_id,'• ارسل الان معرف قناة السورس ',"md",true)  
end
if text and Redis:get(Fast.."set:devsource"..senderr) then
if text == "الغاء الامر •" then
Redis:del(Fast.."set:devsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:devsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'devsource',chsource)
send(msg_chat_id,msg_id,'\n• تم حفظ مطور السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n• ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين مطور السورس •" then
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then 
Redis:set(Fast.."set:devsource"..senderr,true)
send(msg_chat_id,msg_id,'• ارسل الان معرف مطور السورس ',"md",true)
else
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
end
if Redis:get(Fast.."set:rmz"..senderr) then
if text then
if text == "الغاء الامر •" then
Redis:del(Fast.."set:rmz"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
Redis:set(Fast..'rmzsource',text)
Redis:del(Fast.."set:rmz"..senderr)
send(msg_chat_id,msg_id,'تم حفظ رمز السورس ',"md",true)  
dofile('Fast.lua')  
end
end
if text == "تعيين رمز السورس •" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:rmz"..senderr,true)
return send(msg_chat_id,msg_id,'ارسل رمز بدل من { •}',"md",true)  
end
if text == "حذف رمز السورس •" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."rmzsource","• ")
return send(msg_chat_id,msg_id,'تم ارجاع رمز السورس الي  { •}',"md",true)  
end
if text == 'تنظيف المشتركين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' }\n• لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*• البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n• تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*• العدد الكلي { '..#list..' } للمجموعات \n• لا توجد مجموعات وهميه*',"md")
end
end
if text == 'تغيير رسالة ستارت •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Start:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"• ارسل لي رسالة Start الان ","md",true)  
end
if text == 'مسح رسالة ستارت •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Start:Bot") 
return send(msg_chat_id,msg_id,"• تم مسح رسالة Start ","md",true)   
end
if text == 'تغيير اسم البوت •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Name:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"• ارسل لي الاسم الان ","md",true)  
end
if text == 'مسح اسم البوت •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Name:Bot") 
return send(msg_chat_id,msg_id,"• تم مسح اسم البوت ","md",true)   
end
if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*• تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'*• عدد احصائيات البوت الكامله \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n• عدد المجموعات : '..(Redis:scard(Fast..'ChekBotAdd') or 0)..'\n• عدد المشتركين : '..(Redis:scard(Fast..'Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تغيير رسالة المطور •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'• ارسل لي الرسالة الان')
end
if text == 'مسح رسالة المطور •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'• تم مسح رسالة المطور')
end
if text == 'اضف رد عام •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لاضافتها في الردود العامة ","md",true)  
end
if text == 'مسح رد عام •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"• ارسل الان الكلمه لمسحها من الردود العامة","md",true)  
end
if text=='اذاعة خاص •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=='اذاعة للمجموعات •' then 
if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then 
  Redis:setex(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. senderr, 600, true) 
  send(msg_chat_id,msg_id,[[
  ↯︙ارسل لي سواء كان 
  ❨ ملف •ملصق •متحركة •صورة
   •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
  ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
  ↯︙للخروج ارسل ( الغاء )
   ✓
  ]],"md",true)  
  return false
else
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
end

if text=="اذاعة بالتثبيت •" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف •ملصق •متحركة •صورة
 •فيديو •بصمه الفيديو •بصمه •صوت •رسالة ❩
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعة بالتوجيه •" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعة بالتوجيه خاص •' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"• ارسل لي التوجيه الان\n• ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامة •") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامة \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركة 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رسالة ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صورة 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف •"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "• لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == ("مسح الردود العامة •") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"• تم مسح الردود العامة","md",true)  
end
if text == 'مسح المطورين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح المطورين الثانويين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح قائمه العام •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*• تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."BotFree") 
return send(msg_chat_id,msg_id,"• تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."TwaslBot") 
return send(msg_chat_id,msg_id,"• تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."BotFree",true) 
return send(msg_chat_id,msg_id,"• تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."TwaslBot",true) 
return send(msg_chat_id,msg_id,"• تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه المحظورين عام  \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)

if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = senderr..'/BanAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين •' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*• قائمه مطورين البوت \n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.Asasy then
if Redis:get(Fast.."TwaslBot") and not Redis:sismember(Fast.."BaN:In:Tuasl",senderr) then
local ListGet = {Sudo_Id,senderr}
local IdSudo = bot.getChat(ListGet[1]).id
local IdUser = bot.getChat(ListGet[2]).id
local FedMsg = bot.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(Fast.."Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.Fastbots == "messageSticker" then
send(IdSudo,0,Reply_Status(IdUser,'• قام بارسال الملصق').Reply,"md",true)  
end
return send(IdUser,msg_id,Reply_Status(IdUser,'• تم ارسال رسالتك الى المطور').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = bot.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
send(msg_chat_id,msg_id,Reply_Status(Info_User,'• قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
bot.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
bot.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
bot.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
bot.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
bot.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
bot.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
bot.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
bot.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
send(Info_User,0,text,"md",true)
end 
send(msg_chat_id,msg_id,Reply_Status(Info_User,'• تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run
function CallBackLua(data) --- هذا الكالباك بي الابديت 
RunCallBack(data)
end
Redis:sadd(Fast.."eza3a",Token.."&"..Fast)
Redis:set("@"..UserBot,Fast.."&".."@"..UserBot.."$@"..UserSudo.."+"..Token)
Fx.Fastbots.run(CallBackLua)