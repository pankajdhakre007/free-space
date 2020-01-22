package com.free.stuff.chess.pieces;

import static com.free.stuff.chess.utils.PieceMovement.hasPieceInDiagonalPath;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;

public class Bishop extends Piece {

    public Bishop(Color color) {
        super(color);
    }

    @Override
    public boolean canMove(Board board, int srcX, int srcY, int destX, int destY) {

        int x = Math.abs(srcX - destX);
        int y = Math.abs(srcY - destY);
        boolean diagonalMove = x == y;

        boolean hasPiece = board.getBoardBlock(destX, destY).getPiece() != null;
        boolean hasPieceInPath = hasPieceInDiagonalPath(board, srcX, srcY, destX, destY);
        boolean oppositionPiece = hasPiece && board.getBoardBlock(destX, destY).getPiece().getColor() != this.color;

        boolean canMove = diagonalMove && !hasPieceInPath && !hasPiece;
        boolean canKill = diagonalMove && !hasPieceInPath && oppositionPiece;
        return canMove || canKill;

    }

}
