util.AddNetworkString( 'DarkRP_DoQuestion' )
util.AddNetworkString( 'DarkRP_KillQuestionVGUI' )

local Question = {}
local Questions = {}

local function ccDoQuestion(ply, cmd, args)
    
    if not Questions[args[1]] then return end
    if not tonumber(args[2]) then return end

    Questions[args[1]]:handleNewQuestion(tonumber(args[2]), ply)
end
concommand.Add("ans", ccDoQuestion)

local function handleQuestionEnd(id, ply)
    if not Questions[id] then return end
    local q = Questions[id]
    q.Callback(q.yn, q.Ent, q.Initiator, q.Target, unpack(q.Args), ply)
    Questions[id] = nil
end

function Question:handleNewQuestion(response, ply)
    if response == 1 or response == 0 then
        self.yn = tobool(response)
    end
    local ply = ply or nil
    handleQuestionEnd(self.ID, ply)
end

function DarkRP.createQuestion(question, quesid, ent, delay, callback, fromPly, toPly, ...)
    local newques = { }
    for k, v in pairs(Question) do newques[k] = v end

    newques.ID = quesid
    newques.Callback = callback
    newques.Ent = ent
    newques.Initiator = fromPly
    newques.Target = toPly
    newques.Args = {...}

    newques.yn = 0

    Questions[quesid] = newques

    net.Start( 'DarkRP_DoQuestion' )
        net.WriteString( question )
        net.WriteString( quesid )
        net.WriteFloat( delay )
    net.Send( ent )

    timer.Create(quesid .. "timer", delay, 1, function() handleQuestionEnd(quesid) end)
end

function DarkRP.destroyQuestion(id)

    net.Start( 'DarkRP_KillQuestionVGUI' )
        net.WriteString( Questions[id].ID )
    net.Send( Questions[id].Ent )

    Questions[id] = nil
end

function DarkRP.destroyQuestionsWithEnt(ent)
    for _, v in pairs(Questions) do
        if v.Ent == ent then
            DarkRP.destroyQuestion(v.ID)
        end
    end
end