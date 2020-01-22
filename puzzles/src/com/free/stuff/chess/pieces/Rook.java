package com.free.stuff.chess.pieces;

import static com.free.stuff.chess.utils.PieceMovement.hasPieceInLinearPath;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;

public class Rook extends Piece {

    public Rook(Color color) {
        super(color);
    }

    @Override
    public boolean canMove(Board board, int srcX, int srcY, int destX, int destY) {
        int x = Math.abs(srcX - destX);
        int y = Math.abs(srcY - destY);
        boolean linearMove = (x != 0 && y == 0) || (x == 0 && y != 0);

        boolean hasPiece = board.getBoardBlock(destX, destY).getPiece() != null;
        boolean hasPieceInPath = hasPieceInLinearPath(board, srcX, srcY, destX, destY);
        boolean oppositionPiece = hasPiece && board.getBoardBlock(destX, destY).getPiece().getColor() != this.color;

        boolean canMove = linearMove && !hasPieceInPath && !hasPiece;
        boolean canKill = linearMove && !hasPieceInPath && oppositionPiece;
        return canMove || canKill;

    }

}
