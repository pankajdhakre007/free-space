package com.free.stuff.chess.components;

import com.free.stuff.chess.pieces.Bishop;
import com.free.stuff.chess.pieces.Horse;
import com.free.stuff.chess.pieces.King;
import com.free.stuff.chess.pieces.Pawn;
import com.free.stuff.chess.pieces.Queen;
import com.free.stuff.chess.pieces.Rook;
import com.free.stuff.chess.utils.Color;
import com.free.stuff.chess.utils.Constants;
import com.free.stuff.chess.utils.Player;

public class Board {

    private Block[][] chessBoard;
    private boolean matchFinished = false;

    public Board() {
        chessBoard = new Block[Constants.CHESS_BOARD_SIZE][Constants.CHESS_BOARD_SIZE];
        setupBoard();
    }

    private void setupBoard() {
        Color color = Color.WHITE;
        for (int i = 0; i < chessBoard.length; i++) {
            for (int j = 0; j < chessBoard[i].length; j++) {
                chessBoard[i][j] = new Block(color);
                color = color.getOpposite();
            }
            color = color.getOpposite();
        }
        setKings();
        setQueens();
        setBishops();
        setHorse();
        setRook();
        setPawns();
        printBoardType2();
    }

    public boolean isMatchFinished() {
        return matchFinished;
    }

    private void setKings() {
        chessBoard[0][3].setPiece(new King(Color.BLACK));
        chessBoard[7][3].setPiece(new King(Color.WHITE));
    }

    private void setQueens() {
        chessBoard[0][4].setPiece(new Queen(Color.BLACK));
        chessBoard[7][4].setPiece(new Queen(Color.WHITE));
    }

    private void setBishops() {
        chessBoard[0][2].setPiece(new Bishop(Color.BLACK));
        chessBoard[0][5].setPiece(new Bishop(Color.BLACK));
        chessBoard[7][2].setPiece(new Bishop(Color.WHITE));
        chessBoard[7][5].setPiece(new Bishop(Color.WHITE));
    }

    private void setHorse() {
        chessBoard[0][1].setPiece(new Horse(Color.BLACK));
        chessBoard[0][6].setPiece(new Horse(Color.BLACK));
        chessBoard[7][1].setPiece(new Horse(Color.WHITE));
        chessBoard[7][6].setPiece(new Horse(Color.WHITE));
    }

    private void setRook() {
        chessBoard[0][0].setPiece(new Rook(Color.BLACK));
        chessBoard[0][7].setPiece(new Rook(Color.BLACK));
        chessBoard[7][0].setPiece(new Rook(Color.WHITE));
        chessBoard[7][7].setPiece(new Rook(Color.WHITE));
    }

    private void setPawns() {
        for (int i = 0; i < chessBoard.length; i++) {
            chessBoard[1][i].setPiece(new Pawn(Color.BLACK));
            chessBoard[6][i].setPiece(new Pawn(Color.WHITE));
        }
    }

    private void printBoardType2() {
        System.out.println(" ---------------------------------------------------------------------------------------------------------------");
        System.out.println("|                                                                                                               |");
        System.out.println("|             A           B           C           D           E           F           G           H             |");
        System.out.println("|                                                                                                               |");
        System.out.println("|        -----------------------------------------------------------------------------------------------        |");
        for (Integer i = 0; i < chessBoard.length; i++) {

            printBlockRow(chessBoard[i][0].getColor());
            printBlockRow(chessBoard[i][0].getColor());

            System.out.print("|   " + (8 - i) + "   |");
            for (Integer j = 0; j < chessBoard[i].length; j++) {

                System.out.print(chessBoard[i][j].getColor() == Color.WHITE ? "   " : "...");
                System.out.print(chessBoard[i][j].getPiece() != null ? chessBoard[i][j].getPiece() : (chessBoard[i][j].getColor() == Color.WHITE ? "     " : "....."));
                System.out.print(chessBoard[i][j].getColor() == Color.WHITE ? "   |" : "...|");

            }
            System.out.println("   "  + (8 - i) + "   |");

            printBlockRow(chessBoard[i][0].getColor());
            printBlockRow(chessBoard[i][0].getColor());
            System.out.println("|        -----------------------------------------------------------------------------------------------        |");
        }
        System.out.println("|                                                                                                               |");
        System.out.println("|             A           B           C           D           E           F           G           H             |");
        System.out.println("|                                                                                                               |");
        System.out.println(" ---------------------------------------------------------------------------------------------------------------");
    }

    private void printBlockRow(Color color) {
        System.out.print("|       |");
        Color temp = color;
        for (int x = 0; x < 8; x++) {
            if (temp == Color.WHITE) {
                System.out.print("           |");
            } else {
                System.out.print("...........|");
            }
            temp = temp.getOpposite();
        }
        System.out.println("       |");
    }

    private void printBoardType1() {
        System.out.println(" ----------------------------------------------------------------------------------------------");
        System.out.println("|            A         B         C         D         E         F         G         H           |");
        System.out.println("|      ----------------------------------------------------------------------------------      |");
        for (Integer i = 0; i < chessBoard.length; i++) {
            System.out.print("|  " + (8 - i) + "  |  ");
            for (Integer j = 0; j < chessBoard[i].length; j++) {
                System.out.print(chessBoard[i][j] + "  ");
            }
            System.out.println("|  " + (8 - i) + "  |");
        }
        System.out.println("|      ----------------------------------------------------------------------------------      |");
        System.out.println("|            A         B         C         D         E         F         G         H           |");
        System.out.println(" ----------------------------------------------------------------------------------------------");
    }

    private boolean isValid(int x, int y) {
        return 0 <= x && x < Constants.CHESS_BOARD_SIZE && 0 <= y && y < Constants.CHESS_BOARD_SIZE;
    }

    public Block getBoardBlock(int x, int y) {
        return chessBoard[x][y];
    }

    public boolean move(Player player, int srcX, int srcY, int destX, int destY) {
        if (isValid(srcX, srcY) && isValid(destX, destY) && !(srcX == destX && srcY == destY)) {
            Block srcBlock = getBoardBlock(srcX, srcY);
            Block destBlock = getBoardBlock(destX, destY);
            if (srcBlock.getPiece() != null && srcBlock.getPiece().canMove(player, this, srcX, srcY, destX, destY)) {
                if (destBlock.getPiece() != null && destBlock.getPiece() instanceof King) {
                    matchFinished = true;
                }
                destBlock.setPiece(srcBlock.getPiece());
                srcBlock.setPiece(null);
                printBoardType2();
                return true;
            }
        }
        return false;
    }

}
