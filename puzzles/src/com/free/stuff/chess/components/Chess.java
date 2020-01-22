package com.free.stuff.chess.components;

import com.free.stuff.chess.utils.Player;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Chess {

    public static void main(String[] args) {
        System.out.println("Player " + Player.ONE + " is " + Player.ONE.getColor() + " and Player " + Player.TWO + " is " + Player.TWO.getColor());
        System.out.println("Move should be give as D4 E5, where D4 is source location E5 is destination");
        Board b = new Board();
        Player p = Player.ONE;
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        while (!b.isMatchFinished()) {
            System.out.print("Player " + p + "! play your move: ");
            int[] input = read(br);
            if (!b.move(p, input[0], input[1], input[2], input[3])) {
                System.out.println("Invalid move, please move a " + p.getColor() + " piece to valid location!!");
            } else {
                p = p.getNext();
            }
        }
        System.out.println("Player " + p.getNext() + " won.!!");

    }

    private static int[] read(BufferedReader br) {
        boolean captureInput = false;
        int[] input = null;
        while (!captureInput) {
            try {
                String move = br.readLine();
                if (validMove(move)) {
                    input = mapMove(move);
                    captureInput = true;
                }
            } catch (Exception e) {
                System.out.println("Please input valid integer.!!" + e);
            }
        }
        return input;
    }

    private static boolean validMove(String move) {
        return move != null && move.length() == 5;
    }

    private static int[] mapMove(String move) {
        int[] input = new int[4];
        input[1] = move.charAt(0) - 'A';
        input[0] = 8 - (move.charAt(1) - '0');
        input[3] = move.charAt(3) - 'A';
        input[2] = 8 - (move.charAt(4) - '0');
        return input;
    }

}
