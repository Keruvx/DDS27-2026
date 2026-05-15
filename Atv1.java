import java.util.Scanner;

public class Atv1 {

    public static void main(String[] args) {
        int idade = 0;
        
    Scanner scan = new Scanner(System.in);
    
System.out.println("Escreva sua idade: ");
idade = scan.nextInt();
    
if (idade < 16){
     System.out.println("Não pode Votar!");
    }
if ((idade == 16) || (idade == 17) || (idade > 65)){
        System.out.println("Seu Voto e facultativo");
}   
if ((idade >= 18) && (idade <= 65)){
        System.out.println("Voce deve voltar");
}
    else{
System.out.println("Idade Invalida");
}
}
}