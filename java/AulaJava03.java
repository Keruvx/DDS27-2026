package java;

import java.util.Scanner;

public class AulaJava03 {
        public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        
       Conta c;
       c = new Conta();
        
      int opcao = 0;
      double valor = 0;
      boolean resposta;
      
      System.out.println (" ***** Sistema Bancario Online ***** \n") ;

      System.out.println ("Informe o numero da conta: ");
      c.numero = scan.nextInt () ;

      System.out.println ("\nInforme o nome do (a) titular da conta: ");
      c.nome_titular = scan.next() ;

      System.out.println ("\nInforme o saldo atual da conta: ");
      c.saldo = scan.nextDouble () ;
}
