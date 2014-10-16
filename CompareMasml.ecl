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
			l.play.all.exists(playL | r.play.all.selectOne(playR | playR.agentRole.name == playL.agentRole.name));
			/*and 
			((l.ownedBelief.all.size() > 0 and r.ownedBelief.all.size() > 0) or 
			 (l.ownedBelief.all.size() == 0 and r.ownedBelief.all.size() == 0))
		    and 
		    ((l.ownedGoal.all.size() > 0 and r.ownedGoal.all.size() > 0) or 
			 (l.ownedGoal.all.size() == 0 and r.ownedGoal.all.size() == 0))*/
	}
}

rule Association 
	match l : modelo1!Association 
	with r : modelo2!Association {

	compare : l.source.matches(r.source) and l.target.matches(r.target) 
}

rule Organization
	match l : modelo1!Organization
	with r: modelo2!Organization{
	compare : l.name = r.name	
}