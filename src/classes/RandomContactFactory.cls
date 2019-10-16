/**
* @description class which produce list of new contacts
 */
public  class RandomContactFactory {
        /**
        * @description produce a list of  new contacts according to the last name and numOfContact
        * @param numContact number of contacts need to be produce
        * @param lastName last name used to create new contact
        */
        public static List<Contact> generateRandomContacts (Integer numContact, String lastName){
            List<Contact> listContacts = new List<Contact>();
            for(Integer i = 0; i < numContact; i++){
                listContacts.add(new Contact(FirstName='FN'+i, LastName = lastName));
            }
            return listContacts;
        }
    }