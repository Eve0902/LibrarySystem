/**
 * @description a helper class for trigger of Borrower__C
 */

public with sharing class BorrowerHelper {
    /**
     * @description send confirm email to a list of borrowers
     */
    public void helpConfirmEmail( List<Borrower__c> relatedBorrowers){
        List<Id> BorrowerIds = new List<Id>();
    for(Borrower__c newItem : relatedBorrowers) {
        BorrowerIds.add(newItem.Id);
    }
        List<Borrower__c> Borrowers = [SELECT First_Name__c, Email__c
        FROM Borrower__c WHERE Id IN :BorrowerIds AND Email__c <> NULL];
        if(!Borrowers.isEmpty()) {
            String[] addresses = new String[]{},
                    subjects = new String[]{},
                    messages = new String[]{};
            for(Borrower__c bor: Borrowers)	{
                addresses.add(bor.Email__c);
                subjects.add('New Memember Confirmation');
                messages.add('Dear ' + bor.First_Name__c +' Welcome for choosing XXX Library!\n\n');
            }
            EmailManager.sendMail(addresses, subjects, messages);
        }
    }
}