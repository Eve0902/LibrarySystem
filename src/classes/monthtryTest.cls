/**
 * Created by lili on 10/8/2019.
 */

@IsTest
private class monthtryTest {

    @testSetUp

    static void setUp (){
        month_try__c mn= new month_try__c(num1__c = 1, num2__c = 2);
        insert mn;
    }
    @IsTest
    static void testBehavior() {
        List<month_try__c> months = [
                SELECT Id,
                        WF_Saleswoned__c,
                        WF_Scope_2_Market_C__c
                FROM month_try__c
        ];
                System.debug('WF_Saleswoned__c :!!!!!!!!!!!!!!  ' + months[0].WF_Saleswoned__c);
        System.debug('WF_Saleswoned__c :!!!!!!!!!!!!!!  ' + months[0].WF_Scope_2_Market_C__c);
    }
}