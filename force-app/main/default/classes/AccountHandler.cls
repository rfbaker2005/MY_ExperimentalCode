public class AccountHandler {

    /***
     * Fetches accounts either with no criteria or with a search criteria.
     *
     * @param searchKey     - The search pattern of the account name to retrieve.
     * @param sortBy        - The current field by which to sort.
     * @apram sortDirection - The direction of the sorted given the current sortBy field.
     *
     * @return The list of accounts sorted by the sortBy field.
     */
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