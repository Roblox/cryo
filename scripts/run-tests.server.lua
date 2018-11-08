local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TestEZ = require(ReplicatedStorage.Modules.TestEZ)

local Cryo = ReplicatedStorage.Modules.Cryo

TestEZ.TestBootstrap:run({ Cryo }, TestEZ.Reporters.TextReporter)