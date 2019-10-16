/**
 * @description confirmEmail after having a new borrower
 */
trigger confirmEmail on Borrower__c (after insert) {
    BorrowerHelper brHelper = new BorrowerHelper();
    brHelper.helpConfirmEmail((List<Borrower__c>)trigger.new);
}