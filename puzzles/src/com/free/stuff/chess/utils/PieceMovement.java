package com.free.stuff.chess.utils;

import com.free.stuff.chess.components.Board;

public class PieceMovement {

    private PieceMovement() {
    }

    public static boolean hasPieceInDiagonalPath(Board board, int srcX, int srcY, int destX, int destY) {
        Integer incX = srcX > destX ? -1 : 1;
        Integer incY = srcY > destY ? -1 : 1;
        Integer startX = srcX + incX;
        Integer startY = srcY + incY;
        while (startX != destX && startY != destY) {
            if (board.getBoardBlock(startX, startY).getPiece() != null) {
                return true;
            }
            startX += incX;
            startY += incY;
        }
        return false;
    }

    public static boolean hasPieceInLinearPath(Board board, int srcX, int srcY, int destX, int destY) {
        int x = Math.abs(srcX - destX);
        int y = Math.abs(srcY - destY);
        if (x != 0 && y == 0) {
            return checkPieceInVerticalPath(board, srcX, srcY, destX);
        } else {
            return checkPieceInHorizontalPath(board, srcX, srcY, destY);
        }
    }

    private static boolean checkPieceInVerticalPath(Board board, int srcX, int srcY, int destX) {
        int inc = srcX > destX ? -1 : 1;
        int start = srcX + inc;
        while (start != destX) {
            if (board.getBoardBlock(start, srcY).getPiece() != null) {
                return true;
            }
            start += inc;
        }
        return false;
    }

    private static boolean checkPieceInHorizontalPath(Board board, int srcX, int srcY, int destY) {
        int inc = srcY > destY ? -1 : 1;
        int start = srcY + inc;
        while (start != destY) {
            if (board.getBoardBlock(srcX, start).getPiece() != null) {
                return true;
            }
            start += inc;
        }
        return false;
    }

}
