/**
 * Created by lili on 10/11/2019.
 */

public with sharing class OppotunityHelper {
    /**
    * @description  update the number of Opptunities to their related Account
    * @param opps a list of new oppotunities just created
    */
        public void updateNumOfOpps(List<Opportunity> opps) {
            System.debug('Trigger Happened');
            if (!opps.isEmpty()) {
                List<Account> accts = getParentAccounts(opps);
                if (accts!=null) {
                    for (Account acct : accts) {
                        acct.Number_of_Opps__c ++;
                    }
                    update accts;
                }
            }
        }

        /**
         * @requirements  opps is not empty
         * @description   get the related accounts according to a list of oppotunities
         * @param opps   a list of oppotunities
         */
        public List<Account> getParentAccounts(List<Opportunity> opps) {
            List<Id> acctIds = new  List<Id>();
                for(Opportunity opp:opps){
                    if (opp.AccountId!=null) {
                        acctIds.add(opp.AccountId);
                    }
                }
            List<Account> accts = new List<Account>();
            if(!acctIds.isEmpty()){
                 accts = [
                        SELECT
                                Id,
                                Number_of_Opps__c
                        FROM Account
                        WHERE Id IN :acctIds
                ];
            }
            return accts;
        }
    }
