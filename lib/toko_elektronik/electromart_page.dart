import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color ink = Color(0xFF242321);
const Color cream = Color(0xFFF5F0E9);
const Color paper = Color(0xFFFFFEFC);
const Color brown = Color(0xFF925638);
const Color muted = Color(0xFF85817C);
const Color line = Color(0xFFEAE5DE);

class Product {
  final String id, name, category, description;
  final int price, stock;
  final IconData icon;
  const Product(this.id, this.name, this.category, this.description,
      this.price, this.stock, this.icon);
}

const products = <Product>[
  Product('P001', 'Smartphone Nova X', 'Smartphone',
      'Layar AMOLED, kamera jernih, dan performa cepat untuk aktivitas harian.',
      4299000, 12, Icons.phone_iphone_rounded),
  Product('P002', 'Laptop Pro 14', 'Laptop',
      'Laptop ringan untuk produktivitas, kuliah, dan pekerjaan kreatif.',
      8999000, 7, Icons.laptop_mac_rounded),
  Product('P003', 'Headphone Studio', 'Audio',
      'Suara detail dengan bantalan empuk dan koneksi nirkabel.',
      799000, 20, Icons.headphones_rounded),
  Product('P004', 'Smartwatch Active', 'Accessories',
      'Pantau aktivitas dan notifikasi langsung dari pergelangan tangan.',
      1250000, 15, Icons.watch_rounded),
  Product('P005', 'Tablet Air 11', 'Smartphone',
      'Tablet serbaguna untuk hiburan, membaca, dan multitasking.',
      5499000, 9, Icons.tablet_mac_rounded),
  Product('P006', 'Speaker Mini', 'Audio',
      'Speaker ringkas dengan suara lantang untuk menemani perjalanan.',
      499000, 18, Icons.speaker_rounded),
  Product('P007', 'Mechanical Keyboard', 'Accessories',
      'Keyboard tactile dengan desain ringkas dan nyaman digunakan.',
      650000, 11, Icons.keyboard_rounded),
  Product('P008', 'Monitor 27 Inch', 'Laptop',
      'Monitor berukuran lega untuk setup kerja dan hiburan di rumah.',
      2199000, 6, Icons.desktop_windows_rounded),
];

String rupiah(int value) {
  final s = value.toString();
  final out = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    out.write(s[i]);
    final remaining = s.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) out.write('.');
  }
  return 'Rp${out.toString()}';
}


class ElectroMartPage extends StatefulWidget {
  const ElectroMartPage({super.key});

  @override
  State<ElectroMartPage> createState() => _ElectroMartPageState();
}

class _ElectroMartPageState extends State<ElectroMartPage> {
  final Map<String, int> cart = {};
  ReceiptData? lastReceipt;

  int get totalItems => cart.values.fold(0, (a, b) => a + b);
  int get total => cart.entries.fold(0, (sum, entry) {
    final product = products.firstWhere((p) => p.id == entry.key);
    return sum + product.price * entry.value;
  });

  void add(Product product) {
    setState(() => cart[product.id] = (cart[product.id] ?? 0) + 1);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} ditambahkan ke keranjang'),
        duration: const Duration(milliseconds: 900),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void changeQty(Product product, int delta) {
    setState(() {
      final next = (cart[product.id] ?? 0) + delta;
      if (next <= 0) {
        cart.remove(product.id);
      } else {
        cart[product.id] = next;
      }
    });
  }

  void checkout(ReceiptData receipt) {
    setState(() {
      lastReceipt = receipt;
      cart.clear();
    });
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ReceiptPage(receipt: receipt)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: cream,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: brown,
          surface: cream,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: cream,
          foregroundColor: ink,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      child: ElectroHomePage(
        cart: cart,
        totalItems: totalItems,
        onAdd: add,
        onOpenCart: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CheckoutPage(
              cart: cart,
              total: total,
              onQty: changeQty,
              onPaid: checkout,
            ),
          ),
        ),
      ),
    );
  }
}

class ElectroHomePage extends StatefulWidget {
  final Map<String, int> cart; 
  final int totalItems;
  final ValueChanged<Product> onAdd;
  final VoidCallback onOpenCart;
  const ElectroHomePage({super.key, required this.cart, required this.totalItems,
    required this.onAdd, required this.onOpenCart});
  @override
  State<ElectroHomePage> createState() => _ElectroHomePageState();
}

class _ElectroHomePageState extends State<ElectroHomePage> {
  String category = 'Semua';
  String search = '';
  final categories = const ['Semua', 'Smartphone', 'Laptop', 'Audio', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    final shown = products.where((p) {
      final matchCategory = category == 'Semua' || p.category == category;
      final matchSearch = p.name.toLowerCase().contains(search.toLowerCase());
      return matchCategory && matchSearch;
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
              sliver: SliverToBoxAdapter(
                child: Row(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(14)),
                    child: const Icon(Icons.grid_view_rounded, color: brown),
                  ),
                  const Spacer(),
                  const Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text('ELECTROMART', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.2, fontSize: 12)),
                    Text('Your tech, your style', style: TextStyle(color: muted, fontSize: 11)),
                  ]),
                  const SizedBox(width: 12),
                  CircleAvatar(backgroundColor: const Color(0xFFE5D5C8),
                    child: const Icon(Icons.person_outline_rounded, color: brown)),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
              sliver: SliverToBoxAdapter(
                child: Text('Temukan teknologi\\nuntuk keseharianmu',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800, height: 1.18, color: ink)),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Row(children: [
                  Expanded(child: TextField(
                    onChanged: (v) => setState(() => search = v),
                    decoration: InputDecoration(
                      hintText: 'Cari produk elektronik...',
                      prefixIcon: const Icon(Icons.search_rounded, color: muted),
                      filled: true, fillColor: paper,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
                    ),
                  )),
                  const SizedBox(width: 9),
                  Container(
                    height: 52, width: 52,
                    decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(14)),
                    child: IconButton(onPressed: widget.onOpenCart,
                      icon: Badge(label: Text('${widget.totalItems}'),
                        isLabelVisible: widget.totalItems > 0,
                        child: const Icon(Icons.shopping_bag_outlined, color: Colors.white))),
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 142, padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: ink, borderRadius: BorderRadius.circular(22),
                    gradient: const LinearGradient(colors: [Color(0xFF292827), Color(0xFF514239)]),
                  ),
                  child: Row(children: [
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('PROMO MINGGU INI', style: TextStyle(color: Color(0xFFD9B79F), fontSize: 10, letterSpacing: 1.4, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 7),
                      const Text('Upgrade gadget-mu!', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      const Text('Diskon hingga 30% untuk pilihan produk', style: TextStyle(color: Colors.white70, fontSize: 11)),
                      const SizedBox(height: 8),
                      Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(20)),
                        child: const Text('Belanja sekarang', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                    ])),
                    const Icon(Icons.devices_other_rounded, color: Color(0xFFD9B79F), size: 78),
                  ]),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 10),
              sliver: SliverToBoxAdapter(
                child: Row(children: [
                  const Expanded(child: Text('Produk pilihan', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800))),
                  Text('${shown.length} produk', style: const TextStyle(color: muted, fontSize: 11)),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 42, child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final selected = category == categories[i];
                  return ChoiceChip(
                    label: Text(categories[i]),
                    selected: selected,
                    onSelected: (_) => setState(() => category = categories[i]),
                    selectedColor: brown,
                    backgroundColor: paper,
                    labelStyle: TextStyle(color: selected ? Colors.white : ink, fontSize: 11, fontWeight: FontWeight.w600),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  );
                },
              )),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 26),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final p = shown[index];
                  return ProductCard(product: p, onAdd: () => widget.onAdd(p));
                }, childCount: shown.length),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12,
                  childAspectRatio: .73,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(active: 0, onCart: widget.onOpenCart),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;
  const ProductCard({super.key, required this.product, required this.onAdd});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(18)),
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(child: Container(
          width: double.infinity, margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: const Color(0xFFF1EEE9), borderRadius: BorderRadius.circular(13)),
          child: Stack(children: [
            Center(child: Icon(product.icon, size: 68, color: brown)),
            Positioned(top: 8, right: 8, child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.favorite_border_rounded, size: 15, color: brown))),
          ]),
        )),
        Padding(padding: const EdgeInsets.fromLTRB(11, 0, 11, 10), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(product.category, style: const TextStyle(color: muted, fontSize: 10)),
            const SizedBox(height: 3),
            Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
            const SizedBox(height: 5),
            Row(children: [
              Expanded(child: Text(rupiah(product.price), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12))),
              InkWell(onTap: onAdd, borderRadius: BorderRadius.circular(9),
                child: Container(padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(color: brown, borderRadius: BorderRadius.circular(9)),
                  child: const Icon(Icons.add_rounded, color: Colors.white, size: 17))),
            ]),
          ],
        )),
      ]),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  final Map<String, int> cart;
  final int total;
  final void Function(Product, int) onQty;
  final ValueChanged<ReceiptData> onPaid;
  const CheckoutPage({super.key, required this.cart, required this.total,
    required this.onQty, required this.onPaid});
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String method = 'Tunai';
  final cashController = TextEditingController();
  String? error;

  int get total => widget.cart.entries.fold(0, (sum, e) =>
    sum + products.firstWhere((p) => p.id == e.key).price * e.value);
  int get cash => int.tryParse(cashController.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  int get change => cash - total;

  @override
  void dispose() { cashController.dispose(); super.dispose(); }

  void pay() {
    if (widget.cart.isEmpty) {
      setState(() => error = 'Keranjang masih kosong.');
      return;
    }
    if (method == 'Tunai' && cash < total) {
      setState(() => error = 'Pembayaran gagal: uang yang dimasukkan masih kurang ${rupiah(total - cash)}.');
      return;
    }
    final receipt = ReceiptData(
      transactionId: 'EM-${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}',
      date: DateTime.now(),
      lines: widget.cart.entries.map((e) => ReceiptLine(
        products.firstWhere((p) => p.id == e.key), e.value)).toList(),
      total: total,
      paymentMethod: method,
      paid: method == 'Tunai' ? cash : total,
      change: method == 'Tunai' ? change : 0,
    );
    widget.onPaid(receipt);
  } 

  @override
  Widget build(BuildContext context) {
    final entries = widget.cart.entries.toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_rounded), onPressed: () => Navigator.pop(context)),
        title: const Text('Detail & Pembayaran', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
      ),
      body: widget.cart.isEmpty
        ? const Center(child: Text('Keranjang kosong.Tambahkan produk terlebih dahulu.', textAlign: TextAlign.center))
        : ListView(padding: const EdgeInsets.fromLTRB(18, 6, 18, 24), children: [
          const Text('Item yang dibeli', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17)),
          const SizedBox(height: 10),
          ...entries.map((e) {
            final p = products.firstWhere((x) => x.id == e.key);
            return Container(
              margin: const EdgeInsets.only(bottom: 9), padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(16)),
              child: Row(children: [
                Container(width: 58, height: 58, decoration: BoxDecoration(color: cream, borderRadius: BorderRadius.circular(12)),
                  child: Icon(p.icon, color: brown, size: 30)),
                const SizedBox(width: 11),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(p.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(rupiah(p.price), style: const TextStyle(color: muted, fontSize: 11)),
                ])),
                Row(children: [
                  _qtyButton(Icons.remove, () => setState(() => widget.onQty(p, -1))),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Text('${e.value}', style: const TextStyle(fontWeight: FontWeight.bold))),
                  _qtyButton(Icons.add, () => setState(() => widget.onQty(p, 1))),
                ]),
              ]),
            );
          }),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(17)),
            child: Column(children: [
              _summaryRow('Subtotal', rupiah(total)),
              const SizedBox(height: 9),
              _summaryRow('Biaya layanan', rupiah(0)),
              const Divider(height: 22, color: line),
              _summaryRow('Total pembayaran', rupiah(total), bold: true),
            ]),
          ),
          const SizedBox(height: 20),
          const Text('Metode pembayaran', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _methodCard('Tunai', Icons.payments_outlined)),
            const SizedBox(width: 10),
            Expanded(child: _methodCard('QRIS', Icons.qr_code_2_rounded)),
          ]),
          const SizedBox(height: 12),
          if (method == 'Tunai') ...[
            const Text('Nominal uang diterima', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            const SizedBox(height: 7),
            TextField(
              controller: cashController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (_) => setState(() => error = null),
              decoration: InputDecoration(
                prefixText: 'Rp ',
                hintText: 'Contoh: 500000',
                filled: true, fillColor: paper,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 9),
            Container(padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(color: const Color(0xFFEDE5DC), borderRadius: BorderRadius.circular(13)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(cash >= total ? 'Uang kembalian' : 'Kekurangan pembayaran',
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                Text(rupiah(cash >= total ? change : (total - cash)),
                  style: TextStyle(fontWeight: FontWeight.w800, color: cash >= total ? brown : Colors.red)),
              ]),
            ),
          ] else ...[
            Container(width: double.infinity, padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(16)),
              child: Column(children: [
                const Icon(Icons.qr_code_2_rounded, size: 126, color: ink),
                const Text('SIMULASI QRIS', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.3)),
                const SizedBox(height: 5),
                const Text('Konfirmasi untuk menyelesaikan pembayaran demo.',
                  textAlign: TextAlign.center, style: TextStyle(color: muted, fontSize: 11)),
                const SizedBox(height: 7),
                Text(rupiah(total), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 19, color: brown)),
              ]),
            ),
          ],
          if (error != null) Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(error!, style: const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 17),
          SizedBox(height: 52, child: FilledButton(
            onPressed: pay,
            style: FilledButton.styleFrom(backgroundColor: brown, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
            child: Text(method == 'Tunai' ? 'Bayar sekarang' : 'Konfirmasi pembayaran',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          )),
        ]),
      bottomNavigationBar: const BottomBar(active: 1),
    );
  }

  Widget _methodCard(String label, IconData icon) {
    final selected = method == label;
    return InkWell(
      onTap: () => setState(() { method = label; error = null; }),
      borderRadius: BorderRadius.circular(14),
      child: Container(padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(color: selected ? const Color(0xFFE9D8CA) : paper,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: selected ? brown : line, width: selected ? 1.5 : 1)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: brown, size: 20), const SizedBox(width: 7),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
          if (selected) ...[const SizedBox(width: 5), const Icon(Icons.check_circle, color: brown, size: 15)],
        ]),
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) => InkWell(
    onTap: onTap, borderRadius: BorderRadius.circular(8),
    child: Container(width: 27, height: 27,
      decoration: BoxDecoration(color: cream, borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, size: 15, color: brown)),
  );
}

Widget _summaryRow(String label, String value, {bool bold = false}) => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(label, style: TextStyle(fontSize: 12, color: bold ? ink : muted, fontWeight: bold ? FontWeight.w800 : FontWeight.normal)),
    Text(value, style: TextStyle(fontSize: 12, color: ink, fontWeight: bold ? FontWeight.w900 : FontWeight.w600)),
  ],
);

class ReceiptLine {
  final Product product;
  final int quantity;
  ReceiptLine(this.product, this.quantity);
}
class ReceiptData {
  final String transactionId, paymentMethod;
  final DateTime date;
  final List<ReceiptLine> lines;
  final int total, paid, change;
  ReceiptData({required this.transactionId, required this.date, required this.lines,
    required this.total, required this.paymentMethod, required this.paid, required this.change});
}

class ReceiptPage extends StatelessWidget {
  final ReceiptData receipt;
  const ReceiptPage({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    final date = '${receipt.date.day.toString().padLeft(2, '0')}/${receipt.date.month.toString().padLeft(2, '0')}/${receipt.date.year}  ${receipt.date.hour.toString().padLeft(2, '0')}:${receipt.date.minute.toString().padLeft(2, '0')}';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Struk Pembayaran', style: TextStyle(fontWeight: FontWeight.w800)),
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 25), children: [
        Container(padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Container(width: 58, height: 58,
              decoration: BoxDecoration(color: const Color(0xFFE9D8CA), borderRadius: BorderRadius.circular(18)),
              child: const Icon(Icons.check_rounded, color: brown, size: 34)),
            const SizedBox(height: 12),
            const Text('Pembayaran Berhasil!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            const Text('Terima kasih telah berbelanja di ElectroMart',
              textAlign: TextAlign.center, style: TextStyle(color: muted, fontSize: 11)),
            const SizedBox(height: 20),
            const Divider(color: line),
            _receiptInfo('No. transaksi', receipt.transactionId),
            _receiptInfo('Tanggal', date),
            _receiptInfo('Metode pembayaran', receipt.paymentMethod),
            const Divider(color: line, height: 25),
            const Align(alignment: Alignment.centerLeft,
              child: Text('Rincian pembelian', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14))),
            const SizedBox(height: 12),
            ...receipt.lines.map((line) => Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(line.product.name, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
                  Text('${line.quantity} x ${rupiah(line.product.price)}', style: const TextStyle(color: muted, fontSize: 10)),
                ])),
                Text(rupiah(line.quantity * line.product.price), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ]),
            )),
            const Divider(color: line, height: 22),
            _receiptInfo('Total', rupiah(receipt.total), bold: true),
            _receiptInfo('Uang diterima', rupiah(receipt.paid)),
            _receiptInfo('Kembalian', rupiah(receipt.change), bold: true),
            const SizedBox(height: 18),
            const Text('— — — — — — — — — — — — — —',
              style: TextStyle(color: muted, letterSpacing: 1)),
            const SizedBox(height: 10),
            const Text('Simpan struk ini sebagai bukti pembayaran.',
              textAlign: TextAlign.center, style: TextStyle(color: muted, fontSize: 10)),
          ]),
        ),
        const SizedBox(height: 15),
        SizedBox(height: 50, child: OutlinedButton.icon(
          onPressed: () => Clipboard.setData(ClipboardData(text:
            'ElectroMart\\nNo: ${receipt.transactionId}\\nTotal: ${rupiah(receipt.total)}\\nMetode: ${receipt.paymentMethod}\\nDibayar: ${rupiah(receipt.paid)}\\nKembalian: ${rupiah(receipt.change)}')),
          icon: const Icon(Icons.copy_rounded), label: const Text('Salin struk'),
          style: OutlinedButton.styleFrom(foregroundColor: brown, side: const BorderSide(color: brown),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
        )),
        const SizedBox(height: 9),
        SizedBox(height: 50, child: FilledButton(
          onPressed: () => Navigator.of(context).popUntil(
            (route) => route.settings.name == '/toko-elektronik',
          ),
          style: FilledButton.styleFrom(backgroundColor: brown,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13))),
          child: const Text('Kembali ke beranda', style: TextStyle(fontWeight: FontWeight.bold)),
        )),
      ]),
    );
  }

  Widget _receiptInfo(String label, String value, {bool bold = false}) => Padding(
    padding: const EdgeInsets.only(bottom: 9),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: const TextStyle(color: muted, fontSize: 11)),
      Flexible(child: Text(value, textAlign: TextAlign.right,
        style: TextStyle(fontSize: 11, fontWeight: bold ? FontWeight.w900 : FontWeight.w600))),
    ]),
  );
}

class BottomBar extends StatelessWidget {
  final int active;
  final VoidCallback? onCart;
  const BottomBar({super.key, required this.active, this.onCart});
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 14),
    decoration: BoxDecoration(color: paper, borderRadius: BorderRadius.circular(22),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 16, offset: const Offset(0, 4))]),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
     _navIcon(
        Icons.home_rounded,
        active == 0,
        () {
          Navigator.of(context).popUntil(
            (route) => route.settings.name == '/toko-elektronik',
          );
        },
      ),
      _navIcon(Icons.shopping_bag_outlined, active == 1, onCart ?? () {}),
      _navIcon(Icons.receipt_long_outlined, false, () {}),
      _navIcon(Icons.person_outline_rounded, false, () {}),
    ]),
  );
  Widget _navIcon(IconData icon, bool selected, VoidCallback onTap) => InkWell(
    onTap: onTap, borderRadius: BorderRadius.circular(13),
    child: Container(padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(color: selected ? ink : Colors.transparent, borderRadius: BorderRadius.circular(13)),
      child: Icon(icon, color: selected ? Colors.white : muted, size: 20)),
  );
}
