/**
 * @description a hepler class for email management
 */

public class EmailMissionSpecialist {/**
    /**
    * @description     Send email to my borrower when the book is due in 3 days
    * @Requirement     address has to be a valid email address
    * @param address   email adress send message to
    * @param subjects  subjects of the email
    * @param messages  message in the email
     */
    public void sendMail(String address, String subject, String body) {

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                new Messaging.SingleEmailMessage[] { mail });
        inspectResults(results);
    }

    /**
    * @description     helperfunction for check if the email send successfully
    * @param results   a list of result of sending email
    */
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        return sendResult;
    }
}