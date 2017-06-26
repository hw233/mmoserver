---------------------------------------------------
-- auth： wupeifeng
-- date： 2016/11/08
-- desc： 伤害：输出伤害修改	

--[[
对玩家造成的伤害提高【1】，对怪物造成的伤害提高【2】。			

]]



---------------------------------------------------

require "Common/basic/Timer"
require "Common/basic/Bit"
require "Common/combat/Skill/Buff"

local Buff = require "Common/combat/Skill/Buff"

local DamageChange = ExtendClass(Buff)

function DamageChange:__ctor(scene, buff_id, data)
	self.work_independent = true
end

-- 造成伤害时统一使用这个函数
function DamageChange:ChangeCauseDamage(damage, skill, target)
	if target.entityType == EntityType.Monster then
		return damage * ( 1 + self:GetPara(2) / 10000)
	elseif target.entityType == EntityType.Dummy then
		return damage * ( 1 + self:GetPara(1) / 10000) 
	end

	return damage
end


return DamageChange
