defmodule bio_genetics_power_plus_ultra_turbo do
  def chamada(x) do
    case x do
      "C" -> "G"
      "G" -> "C"
      "A" -> "T"
      "U" -> "A"
      _ -> ""
    end
  end

  def chamadaR(x) do
    case x do
      "G" -> "C"
      "C" -> "G"
      "T" -> "A"
      "A" -> "U"
      _ -> ""
    end
  end

  def intromanD(lista, tamanho) when tamanho >= 2 do
    [cabeca | cauda] = lista
    [chamada(cabeca)] ++ intromanD(cauda, tamanho - 1)
  end

  def intromanD(lista, tamanho) when tamanho == 1 do
    [lista |> hd() |> chamada()]
  end

  def intromanR(lista, tamanho) when tamanho >= 2 do
    [cabeca | cauda] = lista
    [chamadaR(cabeca)] ++ intromanR(cauda, tamanho - 1)
  end

  def intromanR(lista, tamanho) when tamanho == 1 do
    [lista |> hd() |> chamadaR()]
  end

  def rna_to_dna(x) do
    w =
      x
      |> String.upcase()
      |> String.replace("\n", "")
      |> String.replace("ç", "")
      |> String.graphemes()
      |> IO.inspect()

    c = w |> Enum.count()
    intromanD(w, c) |> Enum.join("")
  end

  def dna_to_rna(x) do
    w =
      x
      |> String.upcase()
      |> String.replace("\n", "")
      |> String.replace("ç", "")
      |> String.graphemes()
      |> IO.inspect()

    c = w |> Enum.count()
    intromanR(w, c) |> Enum.join("")
  end
end
