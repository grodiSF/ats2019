# cp ~/data/ats19.json .
# cp ./data/ats19.json .

cp ./data/ats19*.json .
sfdx force:data:soql:query -q "SELECT Id, DeveloperName FROm RecordType WHERE sObjectType = 'Account'" --json | jq -rc '.result.records[] | select(.DeveloperName | IN("ATS19Showroom","ATS19WholesalePartner")) | .DeveloperName + " " + .Id' | while read -r rtname rtid; do sed -i '' "s/@$rtname/$rtid/g" ./ats19_account.json; done;
sfdx force:data:tree:import --p ./ats19_plan.json
rm ./ats19*.json