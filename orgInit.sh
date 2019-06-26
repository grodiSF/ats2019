#cp ./data/ats19*.json .
#sfdx force:data:tree:import -p ./ats19_plan.json
#rm ./ats19*.json
sfdx force:source:push
sfdx force:user:permset:assign --permsetname ATS19