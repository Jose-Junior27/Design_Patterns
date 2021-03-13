unit State;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TCliente = class;

  { IState }

  IState = interface
   ['{99C33CE8-47A5-473D-B558-C098D1935E18}']
     function Salvar: boolean;

  end;

  { TEditState }

  TEditState = class(TInterfacedObject, IState)
  private
    FObj: TCliente;
  public
    constructor Create(Obj: TCliente);
    function Salvar: boolean;
  end;

  { TNewState }

  TNewState = class(TInterfacedObject, IState)
    private
      FObj: TCliente;
    public
      constructor Create(Obj: TCliente);
      function Salvar: boolean;
  end;

  { TBrowseState }

  TBrowseState = class(TInterfacedObject, IState)
  private
    FObj: TCliente;
  public
    constructor Create(Obj: TCliente);
    function Salvar: boolean;
  end;

  { TCliente }

  TCliente = class
  private
    FState: IState;
    procedure SetState(const Value: IState);
  public
    function Salvar: Boolean;
    property State: IState read FState write SetState;
  end;

implementation

{ TCliente }

procedure TCliente.SetState(const Value: IState);
begin
  FState := Value;
end;

function TCliente.Salvar: Boolean;
begin
  Result := FState.Salvar;
end;

{ TBrowseState }

constructor TBrowseState.Create(Obj: TCliente);
begin
  inherited Create;
  FObj:= Obj;
end;

function TBrowseState.Salvar: boolean;
begin
  //Codigo mudar estado
  FObj.State := TBrowseState.Create(FObj);
  WriteLn('Estado New para Browse');
end;

{ TNewState }

constructor TNewState.Create(Obj: TCliente);
begin
  inherited Create;
  FObj:= Obj;
end;

function TNewState.Salvar: boolean;
begin
  //Codigo mudar estado
  WriteLn('Nao está em edicao');
end;

{ TEditState }

constructor TEditState.Create(Obj: TCliente);
begin
  inherited Create;
  FObj:= Obj;
end;

function TEditState.Salvar: boolean;
begin
  //Codigo mudar estado
  FObj.State := TBrowseState.Create(FObj);
  WriteLn('Estado Edit para Browse');
end;

end.

