struct symbol
{
    char *name;
    int offset;
    struct symbol *next;
    int is_scope;
};
typedef struct symbol symbol;

symbol *identifier;


symbol *symbol_table = (symbol *)0;


typedef enum {PUSH_SCOPE, POP_SCOPE, NEW_SYBMOL} STAction;

symbol * putsym (STAction action,char *sym_name)
{
    symbol *ptr;

    switch (action)
    {
        case NEW_SYBMOL:
            // printf("push SYMBOL\n");

            ptr = (symbol *) malloc (sizeof(symbol));
            ptr->name = (char *) malloc (strlen(sym_name)+1);
            strcpy (ptr->name,sym_name);
            ptr->is_scope = 0;
            // ptr->offset = data_location();
            ptr->next = (struct symbol *)symbol_table;
            symbol_table = ptr;

            break;

        case PUSH_SCOPE:
            // printf("push scope\n");
            ptr = (symbol *) malloc (sizeof(symbol));
            ptr->name = (char *) malloc (strlen(sym_name)+1);
            strcpy (ptr->name,sym_name);
            ptr->is_scope =1;
            // ptr->offset = data_location();
            ptr->next = (struct symbol *)symbol_table;
            symbol_table = ptr;
            break;

        case POP_SCOPE:
            // printf("pop scope\n");

            for ( ptr = symbol_table; ptr != (symbol *) 0; ptr = (symbol *)ptr->next ){
                if (ptr->is_scope==1){

                    symbol_table = ptr->next;
                }
            }
            break;

    }

    // symbol *count;
    // for ( count = symbol_table; count != (symbol *) 0; count = (symbol *)count->next ){
    //     printf("%s\n",count->name);

    // }

    return ptr;

}

symbol * getsymInContext (char *sym_name)
{
    symbol *ptr;
    for ( ptr = symbol_table; ptr != (symbol *) 0; ptr = (symbol *)ptr->next )
    {
        if (ptr->is_scope==1){
            return 0;
        }

        if (strcmp (ptr->name,sym_name) == 0)
        {
            return ptr;
        }else{
            return 0;
        }
    }
    return 0;

}


symbol * getsym (char *sym_name)
{
    symbol *ptr;
    for ( ptr = symbol_table; ptr != (symbol *) 0; ptr = (symbol *)ptr->next )
    {
        // printf("compare:\n");
        // printf("%s == %s\n", ptr->name,sym_name);
        if (strcmp (ptr->name,sym_name) == 0)
        {
            return ptr;
        }else{
            return 0;
        }

    }
    return 0;
}
