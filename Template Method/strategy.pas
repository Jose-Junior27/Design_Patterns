unit strategy;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  IStrategy = interface
    procedure AlgorithmInterface;
  end;

  { TConcreteStrategyA }

  TConcreteStrategyA = class(TInterfacedObject, IStrategy)
  public
    procedure AlgorithmInterface;
  end;

  { TConcreteStrategyB }

  TConcreteStrategyB = class(TInterfacedObject, IStrategy)
  public
    procedure AlgorithmInterface;
  end;

  { TConcreteStrategyC }

  TConcreteStrategyC = class(TInterfacedObject, IStrategy)
  public
    procedure AlgorithmInterface;
  end;

  { TContext }

  TContext = Class
  private
    FStrategy: IStrategy;
  public
    constructor Create(Strategy: IStrategy);
    procedure ContextInterface;

  end;

implementation

{ TConcreteStrategyC }

procedure TConcreteStrategyC.AlgorithmInterface;
begin
  WriteLn('TConcreteStrategyC.AlgorithmInterface');
end;

{ TConcreteStrategyB }

procedure TConcreteStrategyB.AlgorithmInterface;
begin
  WriteLn('TConcreteStrategyB.AlgorithmInterface');
end;

{ TConcreteStrategyA }

procedure TConcreteStrategyA.AlgorithmInterface;
begin
  WriteLn('TConcreteStrategyA.AlgorithmInterface');
end;

{ TContext }

constructor TContext.Create(Strategy: IStrategy);
begin
  FStrategy := Strategy;
end;

procedure TContext.ContextInterface;
begin
  FStrategy.AlgorithmInterface;
end;

end.

