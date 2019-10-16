/**
 * @description trigger for Book_Borrower__c
 * */
trigger BokBorTrigger on Book_Borrower__c (before insert,after delete ) {
    BookBorrowerHelper bbHeper = new BookBorrowerHelper();
    if(Trigger.isInsert){
        bbHeper.sendErrorWhileCheckoutTwice(trigger.new);
        Date borDate= Date.today();
        bbHeper.updateCheckOutInfo(trigger.new,borDate,true);
    }else if(Trigger.isDelete){
         bbHeper.updateCheckOutInfo(trigger.new,null,false);
    }

}