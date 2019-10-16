/**
 * @description a helper class for trigger of Book_Borrower__C
 */

public class BookBorrowerHelper {
    /**
    * @description send erro message if the book has been checked out twice
    */
    public void sendErrorWhileCheckoutTwice(List<Book_borrower__c> BookBorList){
        List<Id> bookIds = new List<Id>();
        for(Book_borrower__c newItem : BookBorList) {
            bookIds.add(newItem.Book__c);
        }

        List<Book_Borrower__c> related_books = [SELECT book__c from Book_Borrower__c
        WHERE Book__c IN :bookIds];
        for(Book_Borrower__c request : BookBorList) {
            if(related_books.contains(request)||request.Book__r.checkOut__c==True){
                request.addError('The book has already been checked out');
            }
        }
        }

/**
* @description      Update books in bookId
* @Require:         1. every id in bookIds are valid and exists in my library system
*                   2. borId has to be a borrower id exists in my library system
* @param bookIds    the list of book Id needs to update
* @param borDate    the date to update
* @param isCheckOut the boolean used for updating checkout__c
*/
        public void updateCheckOutInfo( List<Book_Borrower__c> bbs,Date borDate,Boolean isCheckOut){
            List<Id> bookIds = new List<Id>();
            for(Book_borrower__c newItem : bbs) {
            bookIds.add(newItem.Book__c );
            }

            if(!bookIds.isEmpty()){
                List<Book_borrower__c> update_Book = [SELECT Id, Book__r.checkOut__c,
                        Book__r.currentBorrower__c,
                        Book__r.BorrowDate__c,
                        Book__r.DueDate__c
                FROM Book_borrower__c
                WHERE Book__C IN :bookIds];
                for(Book_borrower__c changes :update_Book){
                    changes.Book__r.checkOut__c = isCheckOut;
                    changes.Book__r.BorrowDate__c = borDate;
                }
            }
        }



}