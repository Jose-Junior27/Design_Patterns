program Console;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp, strategy, ConcreteClass, State, observer
  { you can add units after this };

type

  { TDesignPatern }

  TDesignPatern = class(TCustomApplication)
  protected
    Carro: THonda;
    FStrategy: TConcreteStrategyB;
    Contexto: TContext;
    Cliente: TCliente;
    Montadora: TMontadora;
    Car1, Car2: TCarro;

    procedure DoRun; override;

  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TDesignPatern }

procedure TDesignPatern.DoRun;
var
  ErrorMsg: String;
  Ligar: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }
  Writeln('CONCRETE');
  WriteLn();
  Write('ON - para ligar:  ');
  ReadLn(Ligar);
  if (Ligar = 'ON') then
    Carro.Ligar()
  else
    WriteLn('OFF');

  WriteLn('---------------');
  Writeln('STRATEGY');
  WriteLn();
  Write('ON - para ligar:  ');
  ReadLn(Ligar);
  if (Ligar = 'ON') then
    Contexto.ContextInterface
  else
    WriteLn('OFF');

  WriteLn('---------------');
  Writeln('STATE');
  WriteLn();
  Write('ON - para ligar:  ');
  ReadLn(Ligar);
  if (Ligar = 'ON') then
  begin
    Cliente.State := TEditState.Create(Cliente);
    Cliente.Salvar;
  end
  else
    WriteLn('OFF');

   WriteLn('---------------');
  Writeln('OBSERVER');
  WriteLn();
  Write('ON - para ligar:  ');
  ReadLn(Ligar);
  if (Ligar = 'ON') then
  begin
    Montadora.Subscribe(Car1);
    Montadora.Subscribe(Car2);
    Montadora.MudarModeloMontagem;
  end
  else
    WriteLn('OFF');

  WriteLn('Pressione <ENTER> para sair');
  ReadLn;

  // stop program loop
  Terminate;
end;

constructor TDesignPatern.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
  //Concrete
  Carro:= THonda.Create;

  //Stratege
  FStrategy:= TConcreteStrategyB.Create;
  Contexto:= TContext.Create(FStrategy);

  //State
  Cliente:= TCliente.Create;

  //Observer
  Montadora:= TMontadora.Create;
  Car1:= TCarro.Create('Civic');
  Car2:= TCarro.Create('Corolla');



end;

destructor TDesignPatern.Destroy;
begin
  Carro.Free;
  Contexto.Free;
  Cliente.Free;
  Car1.Free;
  Car2.Free;
  Montadora.Free;
  inherited Destroy;
end;

procedure TDesignPatern.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TDesignPatern;
begin
  Application:=TDesignPatern.Create(nil);
  Application.Title:='DesignPatern';
  Application.Run;
  Application.Free;
end.

