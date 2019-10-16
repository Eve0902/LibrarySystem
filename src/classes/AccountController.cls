/**
 * @description helper class for account object
 */
public with sharing class AccountController {
    /**
     * @description return a list of active account
     */
    public static List<Account> getAllActiveAccounts() {
        return [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes'];
    }
}