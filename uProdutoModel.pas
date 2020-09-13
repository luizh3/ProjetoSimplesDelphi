unit uProdutoModel;

interface

  type
    TFProdutoModel = class
    private

    FNomeProduto : String;
    FDescricaoProduto : String;
    FValorProduto : Currency;
    FTpProduto : String;
    FDescontoProduto: Currency;
    FValorLiquidoProduto : Currency;

    procedure SetDescontoProduto(const Value: Currency);
    procedure SetDescricaoProduto(const Value: String);
    procedure SetNomeProduto(const Value: String);
    procedure SetTpProduto(const Value: String);
    procedure SetValorProduto(const Value: Currency);
    procedure SetValorLiquidoProduto(const Value: Currency);

    published

    function GetValorLiquido() : Currency;

    property NomeProduto : String read FNomeProduto write SetNomeProduto;
    property DescricaoProduto : String read FDescricaoProduto write SetDescricaoProduto;
    property DescontoProduto : Currency read FDescontoProduto write SetDescontoProduto;
    property ValorProduto : Currency read FValorProduto write SetValorProduto;
    property TpProduto : String read FTpProduto write SetTpProduto;
    property ValorLiquidoProduto : Currency read GetValorLiquido write SetValorLiquidoProduto;

    public

    end;

implementation

{ TProdutoModel }

function TFProdutoModel.GetValorLiquido: Currency;
begin
  Result := FValorProduto - FDescontoProduto;
end;

procedure TFProdutoModel.SetDescontoProduto(const Value: Currency);
begin
  FDescontoProduto := Value;
end;

procedure TFProdutoModel.SetDescricaoProduto(const Value: String);
begin
  FDescricaoProduto := Value;
end;

procedure TFProdutoModel.SetNomeProduto(const Value: String);
begin
  FNomeProduto := Value;
end;

procedure TFProdutoModel.SetTpProduto(const Value: String);
begin
  FTpProduto := Value;
end;

procedure TFProdutoModel.SetValorLiquidoProduto(const Value: Currency);
begin
  FValorLiquidoProduto := Value;
end;

procedure TFProdutoModel.SetValorProduto(const Value: Currency);
begin
  FValorProduto := Value;
end;

end.
