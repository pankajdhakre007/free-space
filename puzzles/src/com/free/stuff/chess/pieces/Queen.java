package com.free.stuff.chess.pieces;

import static com.free.stuff.chess.utils.PieceMovement.hasPieceInDiagonalPath;
import static com.free.stuff.chess.utils.PieceMovement.hasPieceInLinearPath;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;

public class Queen extends Piece {

    public Queen(Color color) {
        super(color);
    }

    @Override
    public boolean canMove(Board board, int srcX, int srcY, int destX, int destY) {
        int x = Math.abs(srcX - destX);
        int y = Math.abs(srcY - destY);
        boolean diagonalMove = x == y;
        boolean linearMove = (x != 0 && y == 0) || (x == 0 && y != 0);
        boolean movement = diagonalMove || linearMove;

        boolean hasPieceInDiagonalPath = diagonalMove && hasPieceInDiagonalPath(board, srcX, srcY, destX, destY);
        boolean hasPieceInLinearPath = linearMove && hasPieceInLinearPath(board, srcX, srcY, destX, destY);
        boolean hasPieceInPath = hasPieceInDiagonalPath || hasPieceInLinearPath;

        boolean hasPiece = board.getBoardBlock(destX, destY).getPiece() != null;
        boolean oppositionPiece = hasPiece && board.getBoardBlock(destX, destY).getPiece().getColor() != this.color;

        boolean canMove = movement && !hasPieceInPath && !hasPiece;
        boolean canKill = movement && !hasPieceInPath && oppositionPiece;
        return canMove || canKill;
    }

}
