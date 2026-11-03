import java.util.Scanner;

public class My_Name {
	public static void main(String[] args){
		Scanner teclado = new Scanner(System.in);

		System.out.print("Nombre del usuario: ");
		String User_name = teclado.nextLine();

		System.out.print("Primer apellido del usuario: ");
		String User_surname1 = teclado.nextLine();

		System.out.print("Segundo apellido del usuario: ");
		String User_surname2 = teclado.nextLine();

		System.out.println("El nombre del usuario es " + User_name + " " + User_surname1 + " " + User_surname2);
	}
}
