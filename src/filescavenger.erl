
%%% Author: Joshua Muzaaya [0777101638] [joshmuza@gmail.com]
%%% -----------------------------------------------------------------------------------------------

%%% IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
%%% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
%%% CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%%% REDISTRIBUTION AND USE OF THIS SOURCE CODE PLUS ITS COMPILED/BINARY EQUIVALENT, WITH OR WITHOUT 
%%% MODIFICATION ARE PERMITTED UNDER THE CONDITION THAT THE COPYRIGHT AND AUTHOR ARE RETAINED AS IS
%%% ------------------------------------------------------------------------------------------------
%%% @author Joshua Muzaaya <joshmuza@gmail.com>  
%%% @version 1.0.0
%%% @doc 
%%% File Scavenger is my project to learn GIT. Nothing much about it.
%%% @end 
%%% 

-module(filescavenger).

-compile(nowarn_export_all).
-compile(nowarnings_as_errors).

-compile(export_all).

-author('Joshua Muzaaya').
-vsn('1.0.0').


-define(GET(X,Y),proplists:get_value(X,Y)).
-define(DISTINCT(L),sets:to_list(sets:from_list(L))).
-define(STRINGFY(Var),lists:flatten(io_lib:format("~p",[Var]))). 
-define(UPPER(Text),string:to_upper(Text)). 
-define(LOWER(Text),string:to_lower(Text)). 
-define(RPLC(Text,This,WithThis),re:replace(Text,This,WithThis,[{return,list},global])).
-define(STR(XX),lists:flatten(io_lib:format("~p",[XX]))). 
-define(NOW_DATE(),qdate:to_string("D jS-M-Y g:i:s A",{date(),time()})).
-define(NVL(V,Z),nvl(V,Z)).
-define(NULLIF(V,Z),nullif(V,Z)).

nullif(X,X)-> null;
nullif(X,_)-> X.

nvl(X,Y)-> 
	case lists:member(X,?MISSING) of 
		true -> Y;
		_ -> X
	end.

read_env(ENV)->
	case os:getenv(ENV,false) of 
		false -> error;
		Val -> {ok,Val}
	end.

start()-> ok.