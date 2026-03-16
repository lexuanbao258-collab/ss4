package buoi4.baitap;

import java.util.Scanner;

public class baithuchanh3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Nhập kích thước mảng
        System.out.print("Nhập kích thước mảng: ");
        int n = sc.nextInt();

        int[] arr = new int[n];

        // Nhập các phần tử
        for (int i = 0; i < n; i++) {
            System.out.print("Nhập phần tử arr[" + i + "]: ");
            arr[i] = sc.nextInt();
        }

        // Sắp xếp chọn giảm dần
        for (int i = 0; i < n - 1; i++) {
            int maxIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] > arr[maxIndex]) {
                    maxIndex = j;
                }
            }

            int temp = arr[i];
            arr[i] = arr[maxIndex];
            arr[maxIndex] = temp;
        }

        // Hiển thị mảng sau sắp xếp
        System.out.println("Mảng sau khi sắp xếp giảm dần:");
        for (int i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.println();

        // Nhập số cần tìm
        System.out.print("Nhập số cần tìm: ");
        int x = sc.nextInt();

        // Tìm kiếm tuyến tính
        int viTriTuyenTinh = -1;
        for (int i = 0; i < n; i++) {
            if (arr[i] == x) {
                viTriTuyenTinh = i;
                break;
            }
        }

        // Tìm kiếm nhị phân trên mảng giảm dần
        int left = 0;
        int right = n - 1;
        int viTriNhiPhan = -1;

        while (left <= right) {
            int mid = (left + right) / 2;

            if (arr[mid] == x) {
                viTriNhiPhan = mid;
                break;
            } else if (arr[mid] < x) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        }

        // Hiển thị kết quả tìm kiếm tuyến tính
        if (viTriTuyenTinh != -1) {
            System.out.println("Tìm kiếm tuyến tính: Tìm thấy số " + x + " tại vị trí " + viTriTuyenTinh);
        } else {
            System.out.println("Tìm kiếm tuyến tính: Không tìm thấy số " + x);
        }

        // Hiển thị kết quả tìm kiếm nhị phân
        if (viTriNhiPhan != -1) {
            System.out.println("Tìm kiếm nhị phân: Tìm thấy số " + x + " tại vị trí " + viTriNhiPhan);
        } else {
            System.out.println("Tìm kiếm nhị phân: Không tìm thấy số " + x);
        }

        sc.close();
    }
}
