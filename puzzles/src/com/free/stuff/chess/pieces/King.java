package com.free.stuff.chess.pieces;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;

public class King extends Piece {

    public King(Color color) {
        super(color);
    }

    @Override
    public boolean canMove(Board board, int srcX, int srcY, int destX, int destY) {

        int x = Math.abs(srcX - destX);
        int y = Math.abs(srcY - destY);
        boolean diagonalMove = x * y == 1;
        boolean linearMove = x + y == 1;

        boolean hasPiece = board.getBoardBlock(destX, destY).getPiece() != null;
        boolean oppositionPiece = hasPiece && board.getBoardBlock(destX, destY).getPiece().getColor() != this.color;

        boolean canMove = (diagonalMove || linearMove) && !hasPiece;
        boolean canKill = (diagonalMove || linearMove) && oppositionPiece;
        return canMove || canKill;

    }

}
