package buoi4.baitap;

import java.util.Scanner;

public class baithuchanh4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Nhập số phần tử của mảng: ");
        int n = sc.nextInt();

        if (n == 0) {
            System.out.println("Mảng không có phần tử");
            sc.close();
            return;
        }

        int[] arr = new int[n];

        for (int i = 0; i < n; i++) {
            System.out.print("Nhập phần tử arr[" + i + "]: ");
            arr[i] = sc.nextInt();
        }

        int[] ketQua = new int[n];
        int index = 0;

        // Đưa các số chẵn vào trước
        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 == 0) {
                ketQua[index] = arr[i];
                index++;
            }
        }

        // Đưa các số lẻ vào sau
        for (int i = 0; i < n; i++) {
            if (arr[i] % 2 != 0) {
                ketQua[index] = arr[i];
                index++;
            }
        }

        System.out.println("Mảng sau khi sắp xếp:");
        for (int i = 0; i < n; i++) {
            System.out.print(ketQua[i] + " ");
        }

        sc.close();
    }
}
