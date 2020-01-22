package com.free.stuff.chess.pieces;

import com.free.stuff.chess.components.Board;
import com.free.stuff.chess.utils.Color;
import com.free.stuff.chess.utils.Player;

public abstract class Piece {

    protected final Color color;
    protected boolean firstMove = true;

    public Piece(Color color) {
        this.color = color;
    }

    public Color getColor() {
        return color;
    }

    public boolean canMove(Player player, Board board, int srcX, int srcY, int destX, int destY) {
        if (this.color == player.getColor()) {
            // Assuming move() will always be called prior to canMove()
            // and post canMove() piece will always move.
            boolean canMove = canMove(board, srcX, srcY, destX, destY);
            if (firstMove && canMove) {
                firstMove = false;
            }
            return canMove;
        }
        return false;
    }

    public abstract boolean canMove(Board board, int srcX, int srcY, int destX, int destY);

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(" ");
        builder.append(getColor().toString().charAt(0));
        builder.append("-");
        builder.append(this.getClass().getSimpleName().charAt(0));
        builder.append(" ");
        return builder.toString();
    }

}
