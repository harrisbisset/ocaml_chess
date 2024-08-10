type piece_colour =
    | Black
    | White;;

type piece_type =
    | King
    | Queen
	| Rook
	| Bishop
	| Knight
	| Pawn;;

module ChessPiece = struct
	module type Piece = sig
		type capture_squares = bool list
		val valid : capture_squares -> int -> int list
	end

	module King : Piece = struct
		type capture_squares = bool list
		let valid (squares: capture_squares) (pos: int) : int list = 
			let f elem =
				elem = 0
			  in
				List.iter f elem;;
	end
end;;

ChessPiece.King.valid ([]) (0)

class board = object (self)
	val mutable squares = ([] : int list)
	method push x =
		squares <- x :: squares
end;;

class piece (p_colour : piece_colour) (p_type : piece_type) = object (self)
	val piece_colour = p_colour
	val piece_type = p_type
	method get_colour = 
		piece_colour
	method get_type =
		piece_type
end;;