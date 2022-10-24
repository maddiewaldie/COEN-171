/*
 * Solve the n-Pieces problem of trying to place n identical pieces on
 * an n x n chessboard.
 *
 * 	Knights		Bishops		Rooks		Queens		Amazons
 * 2	X		X		X		X		X
 * 3	XX		XX		X		X		X
 * 4	XXX		XXX		XX		X		X
 * 5	XXXX		XXXX		XXX		XX		X
 * 6	XXXXXX		XXXXX		XXX		X		X
 * 7	XXXXXXX		XXXXXXX		XXXX		XX		X
 * 8	379978716	22522960	40320		XX		X
 * 9	19206532478	565532992	362880		XXX		X
 * 10	1120204619108	15915225216	3628800		XXX		X
 */

# ifndef QUEENS_H
# define QUEENS_H
# include <cstdlib>


// An abstract chess piece that cannot be instantiated.

class Piece{
protected:
    int _row, _col;

public:
    int row() const {return _row;}
    int column() const {return _col;}
    void place(int row, int column) { _row = row; _col = column; }
    virtual bool menaces(const Piece *p) const = 0;
};

class Rook: virtual public Piece{
public:
    virtual bool menaces(const Piece *p) const {
        return (_row == p->row() || _col == p->column());
    }
};

class Bishop: virtual public Piece{
public:
    virtual bool menaces(const Piece *p) const {
        int rows = abs(_row - p->row());
        int cols = abs(_col - p->column());
        return rows == cols;
    }
};

class Knight: virtual public Piece{
public:
    virtual bool menaces(const Piece *p) const {
        int rows = abs(_row - p->row());
        int cols = abs(_col - p->column());
        return ((rows == 2 && cols == 1) || (rows == 1 && cols ==2));
    }
};

class Queen: virtual public Rook, Bishop{
public:
    virtual bool menaces(const Piece *p) const{
        return Rook::menaces(p) || Bishop::menaces(p);
    }
};

class Amazon: virtual public Queen, Knight{
public:
    virtual bool menaces(const Piece *p) const{
        return Queen::menaces(p) || Knight::menaces(p);
    }
};

# endif /* QUEENS_H */
