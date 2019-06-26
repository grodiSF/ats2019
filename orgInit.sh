# cp ~/data/ats19.json .
# cp ./data/ats19.json .

cp ./data/ats19*.json .
sfdx force:data:soql:query -q "SELECT Id, DeveloperName FROM RecordType WHERE sObjectType = 'Account'" --json $SFDX_U$ >> ats2019_account_rt_out.json
#cat ./ats2019_account_rt_out.json | jq -rc '.result.records[] | select(.DeveloperName == ("ATS19Showroom","ATS19WholesalePartner")) | .DeveloperName + " " + .Id' | while read -r rtname rtid; do sed -i "s/$rtname/$rtid/g" ./ats19_account_showroom.json; done;
#cat ./ats2019_account_rt_out.json | jq -rc '.result.records[] | select(.DeveloperName == ("ATS19Showroom","ATS19WholesalePartner")) | .DeveloperName + " " + .Id' | while read -r rtname rtid; do sed -i "s/$rtname/$rtid/g" ./ats19_account_wholesalepartner.json; done;
#cat ./ats19_account_showroom.json
#cat ./ats19_account_wholesalepartner.json
cat ./ats2019_account_rt_out.json | jq -rc '.result.records[] | select(.DeveloperName == ("ATS19Showroom","ATS19WholesalePartner")) | .DeveloperName + " " + .Id' | while read -r rtname rtid; do sed -i "s/$rtname/$rtid/g" ./ats19_account_showroom.json; done;
#cat ./ats19_account_showroom.json
cat ./ats2019_account_rt_out.json | jq -rc '.result.records[] | select(.DeveloperName == ("ATS19Showroom","ATS19WholesalePartner")) | .DeveloperName + " " + .Id' | while read -r rtname rtid; do sed -i "s/$rtname/$rtid/g" ./ats19_account_wholesalepartner.json; done;
#cat ./ats19_account_wholesalepartner.json
sfdx force:data:tree:import -p ./ats19_plan.json
rm ./ats19*.json