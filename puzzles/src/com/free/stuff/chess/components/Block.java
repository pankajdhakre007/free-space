package com.free.stuff.chess.components;

import com.free.stuff.chess.pieces.Piece;
import com.free.stuff.chess.utils.Color;

public class Block {

    private final Color color;
    private Piece piece;

    public Block(Color color) {
        super();
        this.color = color;
    }

    public Block(Color color, Piece piece) {
        this(color);
        this.piece = piece;
    }

    public Color getColor() {
        return color;
    }

    public Piece getPiece() {
        return piece;
    }

    public void setPiece(Piece piece) {
        this.piece = piece;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append(color.equals(Color.WHITE) ? "W" : "B");
        builder.append("[");
        builder.append(piece != null ? piece : "     ");
        builder.append("]");
        return builder.toString();
    }

}
