package com.free.stuff.chess.pieces;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;

// TODO: Validate pawn an move only one step after step
// TODO: validate pawn cannot kill in backward diagonal
public class Pawn extends Piece {

    public Pawn(Color color) {
        super(color);
    }

    @Override
    public boolean canMove(Board board, int srcX, int srcY, int destX, int destY) {

        boolean horizontalMove = srcY != destY;
        boolean verticalOneForwardMove = getVerticalDistance(srcX, srcY, destX, destY) == 1;
        boolean verticalTwoForwardMove = firstMove ? getVerticalDistance(srcX, srcY, destX, destY) == 2 : false;
        boolean verticalForwardMove = verticalOneForwardMove || verticalTwoForwardMove;

        boolean hasPiece = board.getBoardBlock(destX, destY).getPiece() != null;
        boolean oppositionPiece = hasPiece && board.getBoardBlock(destX, destY).getPiece().getColor() != this.color;

        int x = getVerticalDistance(srcX, srcY, destX, destY);
        int y = Math.abs(srcY - destY);
        boolean diagonalMove = x == 1 && y == 1;

        boolean canMove = !horizontalMove && verticalForwardMove && !hasPiece;
        boolean canKill = diagonalMove && oppositionPiece;
        return canMove || canKill;

    }

    private int getVerticalDistance(int srcX, int srcY, int destX, int destY) {
        return this.color == Color.WHITE ? srcX - destX : destX - srcX;
    }

}
