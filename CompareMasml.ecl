rule Models 
	match l : modelo1!MasmlClassDiagram 
	with r : modelo2!MasmlClassDiagram {
	compare : true
}

rule AgentClass 
	match l : modelo1!AgentClass 
	with r : modelo2!AgentClass {
	compare{
			return l.name = r.name
			and 
			((l.all.exists(al | r.all.selectOne(ar | ar.name == al.name and 
			((ar.agentownedBelief.all.size() > 0 and al.agentownedBelief.all.size() > 0) or 
			(ar.agentownedBelief.all.size() == 0 and al.agentownedBelief.all.size() == 0))
			and ((ar.ownedAction.all.size() == 0 and al.ownedAction.size() == 0) or ( ar.ownedAction.all.size() > 0 and
			al.ownedAction.all.size() > 0 )) and al.ownedAction.all.exists(ala | ar.all.selectOne(ara | 
			(ara.actionSemantics == 1 and ala.actionSemantics == 1) or
			(ara.actionSemantics == 2 and ala.actionSemantics == 2) 
			))))))
			;
	}
}

rule Association 
	match l : modelo1!Association 
	with r : modelo2!Association {

	compare : l.source.matches(r.source) and l.target.matches(r.target)
			and l.isAbstract.matches(r.isAbstract) and l.isDerived.matches(r.isDerived) 
			and l.isLeaf.matches(r.isLeaf) 
}

rule Organization
	match l : modelo1!Organization
	with r: modelo2!Organization{
	compare : l.name == r.name
		and 
		l.all.exists(oL | r.all.selectOne(oR | oL.name == oR.name
		and
		((oR.agentownedBelief.all.size() > 0 and oL.agentownedBelief.all.size() > 0) or 
			(oR.agentownedBelief.all.size() == 0 and oL.agentownedBelief.all.size() == 0))
		and
		((ar.agentownedGoal.all.size() > 0 and al.agentownedGoal.all.size() > 0) or 
			(ar.agentownedGoal.all.size() == 0 and al.agentownedGoal.all.size() == 0))
		and
		((oR.sentMessage.all.size() == 0 and oL.sentMessage.all.size() == 0) or
			(oR.sentMessage.all.size() > 0 and oL.sentMessage.all.size() > 0)
		and
		((oR.receiveMessage.all.size() == 0 and oL.receiveMessage.all.size() == 0) or
			(oR.receiveMessage.all.size() > 0 and oL.receiveMessage.all.size() > 0)
		)))) 	
}



rule AgentRoleClass 
	match l : modelo1!AgentRoleClass 
	with r : modelo2!AgentRoleClass {
	compare{
			return l.name = r.name
			and 
			((l.all.exists(al | r.all.selectOne(ar | ar.name == al.name and 
			((ar.agentownedBelief.all.size() > 0 and al.agentownedBelief.all.size() > 0) or 
			(ar.agentownedBelief.all.size() == 0 and al.agentownedBelief.all.size() == 0)) and
			((ar.agentownedGoal.all.size() > 0 and al.agentownedGoal.all.size() > 0) or 
			(ar.agentownedGoal.all.size() == 0 and al.agentownedGoal.all.size() == 0))
			
			))));
		   
	}
}

