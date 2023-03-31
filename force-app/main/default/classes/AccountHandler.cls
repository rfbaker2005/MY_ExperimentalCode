public class AccountHandler {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(String searchKey, String sortBy, String sortDirection) {
        String query = 'SELECT Id, Name,Phone,Type FROM Account';
        if (String.isNotEmpty(searchKey)) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
        if (String.isNotEmpty(sortBy) && String.isNotEmpty(sortDirection)){
            query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
        }
        return Database.query(query);
    }
 }