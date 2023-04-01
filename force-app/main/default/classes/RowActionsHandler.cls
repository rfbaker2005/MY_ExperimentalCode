 public class RowActionsHandler {

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccounts() {

        return [SELECT Id, Name, AccountNumber, Type,Phone FROM Account ORDER BY Name];
    }

    @AuraEnabled
    public static void deleteAccount(Account objaccount) {

        try {

            delete objaccount;

        } catch (Exception ex) {

            throw new AuraHandledException(ex.getMessage());
        }
    }
 }