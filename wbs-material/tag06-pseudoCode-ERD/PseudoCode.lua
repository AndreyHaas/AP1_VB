 6 / 2 = 3
 6%2 = 0
 6%5 = 1 = 6-5 = 1





istSchaltJahr(int jahr)
Begin

        Wenn ( jahr % 4 == 0 UND jahr % 100 != 0 ) oder jahr % 400 == 0
                print("Schaltjahr")


        Ansonsten
                print("Kein Schaltjahr")

End


boolean istSchaltJahr(int jahr)
Begin
        Wenn( jahr % 4 == 0 UND jahr % 100 != 0 ) dann
                print("Schaltjahr")
                return true

        Wenn jahr % 400 == 0 dann
                print("Schaltjahr")

                return true

        printf("Kein Schaltjahr")
        return false
END


while(x > 5)
        break;
        continue;


int x = 5

switch(x){
        case 1: 
                break;
        case 5:
                sout("HALLO")
        case 42: 
                do something
        default:
                break;
}


TRY{


}CATCH(Exception ex){

        sout(ex)
}finally{

}




