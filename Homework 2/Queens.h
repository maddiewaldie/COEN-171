/*
 * Solve the n-Pieces problem of trying to place n identical pieces on
 * an n x n chessboard.
 *
 *      Knights         Bishops         Rooks           Queens          Amazons
 * 2    6               4               2               0               0
 * 3    36              26              6               0               0
 * 4    412             260             24              2               0
 * 5    9386            3368            120             10              0
 * 6    257318          53744           720             4               0
 * 7    8891854         1022320         5040            40              0
 * 8    379978716       22522960        40320           92              0
 * 9    19206532478     565532992       362880          352             0
 * 10   1120204619108   15915225216     3628800         724             4
 */

# ifndef QUEENS_H
# define QUEENS_H
# include <cstdlib>


// An abstract chess piece that cannot be instantiated.
class Piece {
protected:
    int _row, _col;

public:
    int row() const { return _row; }
    int column() const { return _col; }
    void place(int row, int column) { _row = row; _col = column; }
    virtual bool menaces(const Piece *p) const = 0;
};

class Rook: virtual public Piece {
public:
    virtual bool menaces(const Piece *p) const {
        return (_row == p->row() || _col == p->column());
    }
};

class Bishop: virtual public Piece {
public:
    virtual bool menaces(const Piece *p) const {
        int rows = abs(_row - p->row());
        int cols = abs(_col - p->column());
        return rows == cols;
    }
};

class Knight: virtual public Piece {
public:
    virtual bool menaces(const Piece *p) const {
        int rows = abs(_row - p->row());
        int cols = abs(_col - p->column());
        return (rows == 2 && cols == 1) || (rows == 1 && cols ==2);
    }
};

class Queen: virtual public Rook, Bishop {
public:
    virtual bool menaces(const Piece *p) const{
        return Rook::menaces(p) || Bishop::menaces(p);
    }
};

class Amazon: virtual public Queen, Knight {
public:
    virtual bool menaces(const Piece *p) const{
        return Queen::menaces(p) || Knight::menaces(p);
    }
};

# endif /* QUEENS_H */
