package com.free.stuff.chess.pieces;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;

public class Horse extends Piece {

    public Horse(Color color) {
        super(color);
    }

    @Override
    public boolean canMove(Board board, int srcX, int srcY, int destX, int destY) {

        int x = Math.abs(srcX - destX);
        int y = Math.abs(srcY - destY);
        boolean move = x * y == 2;

        boolean hasPiece = board.getBoardBlock(destX, destY).getPiece() != null;
        boolean oppositionPiece = hasPiece && board.getBoardBlock(destX, destY).getPiece().getColor() != this.color;

        boolean canMove = move && !hasPiece;
        boolean canKill = move && oppositionPiece;
        return canMove || canKill;

    }

}
