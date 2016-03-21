import java.util.Scanner;

public class Solution {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int low = in.nextInt();
        int high = in.nextInt();

        int msbPosLow = getMsbPos(low);
        int msbPosHigh = getMsbPos(high);

        int lowestMsb = ((1 << msbPosHigh) < low) ? low : (1 << msbPosHigh);
        int mask = (~0 << msbPosHigh) ^ ~flipBit(lowestMsb, msbPosHigh);

        int answer = lowestMsb ^ (msbPosLow != msbPosHigh ? mask : flipBit(mask, msbPosHigh));

        System.out.println(answer);
    }

    private static int getMsbPos(int num) {
        int msbPos = 0;
        for (int tmp = num; (tmp != 1); tmp >>= 1) msbPos++;

        return msbPos;
    }

    private static int flipBit(int num, int pos) {
        return num ^ (1 << pos);
    }
}
