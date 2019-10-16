/**
 * @description a helper class for email sending
 */
public with sharing class EmailManager{
    /**
    * @description     Send email to my borrower when the book is due in 3 days
    * @Requirement     address has to be a valid email address
    * @param address   email adress send message to
    * @param subjects  subjects of the email
    * @param messages  message in the email
     */
    public static void sendMail(String [] addresses, String [] subjects, String [] messages) {
        Messaging.SingleEmailMessage [] emails = new Messaging.SingleEmailMessage[]{};
        Integer numOfEmail = addresses.size();
        for(Integer i=0; i < numOfEmail; i++){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(subjects[i]);
            email.setToAddresses(new List<String> { addresses[i] });
            email.setPlainTextBody(messages[i]);
            emails.add(email);
        }
        Messaging.sendEmail(emails);
    }
}